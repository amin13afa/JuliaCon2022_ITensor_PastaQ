using ITensors, PastaQ 

n = 5 # number of qubits  50
d = 3 # circuit depth     12
i = siteinds("Qubit",n)

Ry(θ) = [("Ry", j, (θ=θ[j],)) for j in 1:n]

CNOT = [("CNOT", j, j+1) for j in 1:(n-1)]


##################3
function U(θ)
    Uθ = Ry(θ[1])
    for l in 2:length(θ)
        Uθ = [Uθ; [CNOT;Ry(θ[1])]] 
    end
    return Uθ
end
θ = [randn(n) for l in 1:(d+1)]
ψ = runcircuit(i, U(θ); cutoff=1e-8)
