# The only test is that the package precompiles and loads!
using CommonWorldInvalidations
using Test

@testset "CommonWorldInvalidations.jl" begin
    @testset "Package loads" begin
        @test true  # Package loaded successfully
    end

    # AllocCheck tests run in a separate group to avoid precompilation issues
    if get(ENV, "GROUP", "all") == "all" || get(ENV, "GROUP", "all") == "nopre"
        include("alloc_tests.jl")
    end
end
