using Distance_Similarity
using Test

function tests()
	@testset "General tests" begin
		@test euclidean_dist([1.4, 2.0], [2.8, 1.0]) == 1.7204650534085253
		@test manhattan_dist([1.4, 2.0], [2.8, 1.0]) == 2.4
		@test cosine_similarity([1.4, 2.0], [2.8, 1.0]) == 0.8155910368616317
		@test minkowski_dist([1.4, 2.0], [2.8, 1.0], 2) == 1.7204650534085253
 		@test weighted_minkowski_dist([1.4, 2.0], [2.8, 1], [2.0, 1.0], 2) == 2.973213749463701
 		@test jaccard_similarity([1.4, 2.0], [2.8, 1]) == 0.0                                                        
	end
	@testset "Errors" begin
		@test_throws ArgumentError euclidean_dist([1.4, 1, 2.7], [2.8, 1])
		@test_throws ArgumentError manhattan_dist([1.4, 1, 2.7], [2.8, 1])
		@test_throws ArgumentError cosine_similarity([1.4, 1, 2.7], [2.8, 1])
		@test_throws ArgumentError minkowski_dist([1.4, 1, 2.7], [2.8, 1], 2)
		@test_throws ArgumentError weighted_minkowski_dist([1.4, 1, 2.7], [2.8, 1], [1.0, 1.0], 2)
		@test_throws ArgumentError jaccard_similarity([1.4, 1, 2.7], [2.8, 1])
	end
	@testset "Conditions" begin
		@test_throws ArgumentError minkowski_dist([1.5, 1, 7], [2.8, 1], -7)
		@test_throws ArgumentError weighted_minkowski_dist([1.4, 1, 4], [2.8, 1], -10)
	end
		
end
