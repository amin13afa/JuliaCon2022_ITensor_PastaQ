using ITensors 
# Index definition
d = 10
i, j, k, l, m, n = Index.((d, d, d, d, d, d))
# ITensor creation 
A = randomITensor(i, j, m)
B = randomITensor(j, k, n)
C = randomITensor(k, l, m)
D = randomITensor(l, i, m)

f(A, B, C, D) = (A * B * C * D)[]

using  Zygote 

∂f_∂A, ∂f_∂B, ∂f_∂C, ∂f_∂D = gradient(f, A, B, C, D)

∂f_∂A ≈ B * C * D
∂f_∂B ≈ C * D * A 
∂f_∂C ≈ D * A * B 
∂f_∂D ≈ A * B * C 
