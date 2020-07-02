using Distance_Similarity, Test

function tests()
	@testset "General tests" begin # fzr um teste para cada medida de distância com o mesmo vetor
		@test euclidean_dist([1.4, 2], [2.8, 1]) == 1.7204650534085253
		@test manhattan_dist([1.4, 2], [2.8, 1]) == 2.4
		@test cosine_similarity([1.4, 2], [2.8, 1]) == 0.8155910368616317
		@test minkowski_dist([1.4, 2], [2.8, 1], 2) == 1.7204650534085253
 		@test weighted_minkowski_dist([1.4, 2], [2.8, 1], [2.0, 1.0], 2) = 		2.973213749463701
 		@test jaccard_similarity([1.4, 2], [2.8, 1]) = 0.0                                                        
	end
	@testset "Errors" begin	# fzr um teste para cd função que resulte em um argError (n precisa ser msm vetor)
		@test _throws ArgumentError euclidean_dist([1.4, 1, 2.7], [2.8, 1])
		@test _throws ArgumentError manhattan_dist([1.4, 1, 2.7], [2.8, 1])
		@test _throws ArgumentError cosine_similarity([1.4, 1, 2.7], [2.8, 1])
		@test _throws ArgumentError minkowski_dist([1.4, 1, 2.7], [2.8, 1], 2)
		@test _throws ArgumentError weighted_minkowski_dist([1.4, 1, 2.7], [2.8, 1], [1.0, 1.0], 2)
		@test _throws ArgumentError jaccard_similarity([1.4, 1, 2.7], [2.8, 1])
	end
	@testset "Conditions" begin
		@test _throws ArgumentError minkowski_dist([1.5, 1, 7], [2.8, 1], -7)
		@test _throws ArgumentError weighted_minkowski_dist([1.4, 1, 4], [2.8, 1], -10)
	end
		
end