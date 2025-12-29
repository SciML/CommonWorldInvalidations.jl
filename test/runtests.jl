# The only test is that the package precompiles and loads!
using CommonWorldInvalidations
using ExplicitImports
using Test

@testset "ExplicitImports" begin
    @test check_no_implicit_imports(CommonWorldInvalidations) === nothing
    @test check_no_stale_explicit_imports(CommonWorldInvalidations) === nothing
end
