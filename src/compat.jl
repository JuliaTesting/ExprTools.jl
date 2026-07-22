@static if !isdefined(Base, :LazyString)
    # `LazyString` was added in Julia 1.8. On older versions fall back to eagerly
    # building the string; correctness is preserved, only the laziness is lost.
    LazyString(parts...) = string(parts...)
end

