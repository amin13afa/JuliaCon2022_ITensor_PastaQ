using ITensors 
i₁, i₂, i₃, i₄ = Index.((2,2,2,2))

A = randomITensor(i₁, i₂, i₃, i₄)

U₃, S₃, A₄ = svd(A,(i₁, i₂, i₃))
U₂, S₂, A₃ = svd(U₃ * S₃,(i₁, i₂))
U₁, S₁, A₂ = svd(U₂ * S₂, i₁)

A₁ = U₁ * S₁ 

println(A₁ * A₂ * A₃ * A₄ ≈ A)