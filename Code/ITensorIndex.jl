# Using ITensors package
using ITensors 
# Create tensor indices
i = Index(2)
j = Index(2)
k = Index(2)
# Create random tensors
A = randomITensor(j)
B = randomITensor(i,k)
C = randomITensor(i,j,k)
# Tensor contraction
# inner product 
A * C 
# Outer product 
A * B
# more complicated contraction 
A * B * C
A * B + C 
################################
# SVD 
U, S, V = svd(C , i ,k)
println(C ≈ U * S * V )
