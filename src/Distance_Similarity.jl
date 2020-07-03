module Distance_Similarity

export euclidean_dist
export manhattan_dist
export cosine_similarity
export minkowski_dist
export weighted_minkowski_dist
export jaccard_similarity

"""
	euclidean_dist(u::AbstractArray, v::AbstractArray)

Returns the euclidean distance between the two arrays

# Examples
```julia-repl
julia> euclidean_dist([1.4, 2], [2.8, 1])
1.7204650534085253
```
"""
function euclidean_dist(u::AbstractArray, v::AbstractArray)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return (sum((u.-v).^2))^(1/2)
	
end

"""
	manhattan_dist(u::AbstractArray, v::AbstractArray)

Returns the manhattan or cityblock distance between the two arrays

# Examples
```julia-repl
julia> manhattan_dist([1.4, 2], [2.8, 1])
2.4
```
"""
function manhattan_dist(u::AbstractArray, v::AbstractArray)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	sum(abs.(u - v))
end

"""
	cosine_similarity(u::AbstractArray, v::AbstractArray)

Returns the cosine similarity between the two arrays.

# Examples
```julia-repl
julia> cosine_similarity([1.4, 2], [2.8, 1])
0.8155910368616317
```
"""
function cosine_similarity(u::AbstractArray, v::AbstractArray)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return (sum(u .* v))/(((sum(u.^2))^(1/2))*((sum(v.^2))^(1/2)))

end

"""
	minkowski_dist(u::AbstractArray, v::AbstractArray, p::Int)

Returns the Minkowski distance between the two arrays

Note: p must be greater than or equal to 1

# Examples
```julia-repl
julia> minkowski_dist([1.4, 2], [2.8, 1], 2)
1.7204650534085253
```
"""
function minkowski_dist(u::AbstractArray, v::AbstractArray, p::Int)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	if(p < 1)
		throw(ArgumentError(" p must be at least 1"))
		return -1
	end
	return ((sum((abs.(u .- v)).^p))^(1/p))
	
end

"""
	weighted_minkowski_dist(u::AbstractArray, v::AbstractArray, w::AbstractArray, p::Int)

Returns the Minkowski distance between the two arrays given a certain weight for each pair of data in u and v.

Note: p must be greater than or equal to 1

# Examples
```julia-repl
julia> weighted_minkowski_dist([1.4, 2], [2.8, 1], [2.0, 1.0], 2)
2.973213749463701
```
"""
function weighted_minkowski_dist(u::AbstractArray, v::AbstractArray, w::AbstractArray, p::Int)
	if((length(u) != length(v)) || (length(u) != length(w)) || (length(v) != length(w)))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	if(p < 1)
		throw(ArgumentError("p must be at least 1"))
		return -1
	end
	
	return ((sum((w.*(abs.(u .- v))).^p)))^(1/p)
end

"""
	jaccard_similarity(u::AbstractArray, v::AbstractArray)

Returns the jaccard similarity between the two arrays.

# Examples
```julia-repl
julia> jaccard_similarity([1.4, 2], [2.8, 1])
0.0
```
"""
function jaccard_similarity(u::AbstractArray, v::AbstractArray)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return length(intersect((u::AbstractArray, v::AbstractArray))) / length(union((u::AbstractArray, v::AbstractArray)))
end


end # module
