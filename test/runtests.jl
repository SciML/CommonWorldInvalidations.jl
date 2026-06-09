using Pkg

const GROUP = get(ENV, "GROUP", "All")

if GROUP == "All" || GROUP == "Core"
    # The only test is that the package precompiles and loads!
    using CommonWorldInvalidations
    using ExplicitImports
    using Test

    @testset "ExplicitImports" begin
        @test check_no_implicit_imports(CommonWorldInvalidations) === nothing
        @test check_no_stale_explicit_imports(CommonWorldInvalidations) === nothing
    end
end

if GROUP == "QA"
    Pkg.activate(joinpath(@__DIR__, "qa"))
    Pkg.instantiate()
    include(joinpath(@__DIR__, "qa", "qa.jl"))
end
