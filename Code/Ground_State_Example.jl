using ITensors, PastaQ 
n = 8 # number of quabits 40 
i = siteinds("Qubit",n)
ψ = ising_ground_state(i; h=0.9)


d = 4 # circuit depth 
Ry(θ) = [("Ry", j, (θ=θ[j],)) for j in 1:n]
CNOT = [("CNOT", j, j+1) for j in 1:(n-1)]

function U(θ)
    Uθ = Ry(θ[1])
    for l in 2:length(θ)
        Uθ = [Uθ; [CNOT; Ry(θ[1])]]
    end
    return Uθ
end

function f(θ)
    ψθ = runcircuit(i, U(θ); cutoff=1e-8)
    return 1 - abs(inner(ψ,ψθ))
end

using Zygote, OptimKit 
f_∇f(θ) = f(θ), gradient(f, θ)[1]
θ = [zeros(n) for l in 1:(d+1)]
θ, = optimize(f_∇f, θ, LBFGS())
