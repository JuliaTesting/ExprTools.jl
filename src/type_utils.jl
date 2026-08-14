"""
    parameters(type)

Extracts the type-parameters of the `type`.

e.g. `parameters(Foo{A, B, C}) == [A, B, C]`
"""
parameters(sig::UnionAll) = parameters(sig.body)
parameters(sig::DataType) = sig.parameters
parameters(sig::Union) = Base.uniontypes(sig)
parameters(sig::TypeVar) = [sig]

# On Julia 1.14.0-DEV.2291 `Type{ConcreteType}` may be represented via `Core.TypeEq`
# instead of `DataType`/`UnionAll`.
# https://github.com/JuliaLang/julia/pull/61915
@static if isdefined(Core, :TypeEq)
    parameters(sig::Core.TypeEq) = Core.svec(sig.T)
end
