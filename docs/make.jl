using CommonWorldInvalidations
using Documenter

doctest(CommonWorldInvalidations)

makedocs(
    modules = [CommonWorldInvalidations],
    sitename = "CommonWorldInvalidations.jl",
    pages = ["Home" => "index.md"],
)
