using ExprTools
using Documenter

makedocs(;
    modules=[ExprTools],
    authors="Curtis Vogt <curtis.vogt@gmail.com>",
    repo="https://github.com/JuliaTesting/ExprTools.jl/blob/{commit}{path}#L{line}",
    sitename="ExprTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaTesting.github.io/ExprTools.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md"
    ],
)

deploydocs(;
    repo="github.com/JuliaTesting/ExprTools.jl",
)
