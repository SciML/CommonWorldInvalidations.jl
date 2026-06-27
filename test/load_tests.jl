using CommonWorldInvalidations
using Test

# This package only defines methods on internal Base functions to trigger
# common-world invalidations; the Core test is simply that it precompiles and loads.
# The full ExplicitImports.jl and Aqua/JET suites run in the QA group (test/qa/qa.jl).
@testset "Load" begin
    @test CommonWorldInvalidations isa Module
end
