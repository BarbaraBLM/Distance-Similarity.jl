module Distance_Similarity

export euclidean_dist
export manhattan_dist
export cosine_similarity
export minkowski_dist
export weighted_minkowski_dist
export jaccard_similarity


function euclidean_dist(u, v)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return (sum((u.-v).^2))^(1/2)
	
end


function manhattan_dist(u, v)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	sum(abs.(u - v))
end


function cosine_similarity(u, v)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return (sum(u .* v))/(((sum(u.^2))^(1/2))*((sum(v.^2))^(1/2)))

end

function minkowski_dist(u, v, p)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	if(p < 1)
		throw(ArgumentError(" p must be at least 1")
		return -1
	end
	return ((sum((abs.(u .- v)).^p))^(1/p))
	
end


function weighted_minkowski_dist(u, v, w, p)
	if((length(u) != length(v)) || (length(u) != length(w)) || (length(v) != length(w)))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	if(p < 1)
		throw(ArgumentError("p must be at least 1")
		return -1
	end
	
	return ((sum((w.*(abs.(u .- v))).^p)))^(1/p)
end

function jaccard_similarity(u, v)
	if(length(u) != length(v))
		throw(ArgumentError("Vectors must be the same size."))
		return -1
	end
	return length(intersect(u, v)) / length(union(u, v))
end


end # module
