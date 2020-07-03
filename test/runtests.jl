using Distance_Similarity
using Test

function tests()
	@testset "General tests" begin
		@test euclidean_dist([1.4, 2.0], [2.8, 1.0]) == 1.7204650534085253
		@test manhattan_dist([1.4, 2.0], [2.8, 1.0]) == 2.4
		@test cosine_similarity([1.4, 2.0], [2.8, 1.0]) == 0.8155910368616317
	end
	@testset "Errors" begin
	end
	@testset "Conditions" begin
	end
end