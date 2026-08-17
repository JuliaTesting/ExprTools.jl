"""
    parameters(type)

Extracts the type-parameters of the `type`.

e.g. `parameters(Foo{A, B, C}) == [A, B, C]`
"""
parameters(sig::UnionAll) = parameters(sig.body)
# Introduced in Julia 1.14.0-DEV.2291 https://github.com/JuliaLang/julia/pull/61915
# type_parameter is the officially supported way of doing this, and accessing directly is deprecated
@static if isdefined(Base, :type_parameter)
    parameters(sig::DataType) = Base.type_parameter(sig)
else
    parameters(sig::DataType) = sig.parameters
end
parameters(sig::Union) = Base.uniontypes(sig)
parameters(sig::TypeVar) = [sig]

# On Julia 1.14.0-DEV.2291 `Type{ConcreteType}` may be represented via `Core.TypeEq`
# instead of `DataType`/`UnionAll`.
# https://github.com/JuliaLang/julia/pull/61915
@static if isdefined(Core, :TypeEq)
    parameters(sig::Core.TypeEq) = [sig.T]
end
