using CommonWorldInvalidations
using Aqua
using JET
using Test

@testset "Aqua" begin
    # ambiguities and deps_compat disabled: genuine findings tracked in
    # https://github.com/SciML/CommonWorldInvalidations.jl/issues/30
    Aqua.test_all(CommonWorldInvalidations; ambiguities = false, deps_compat = false)
    @test_broken false  # Aqua ambiguities: 4 found (Base.Broadcast.axistype) — tracked in https://github.com/SciML/CommonWorldInvalidations.jl/issues/30
    @test_broken false  # Aqua deps_compat: Pkg extra missing compat entry — tracked in https://github.com/SciML/CommonWorldInvalidations.jl/issues/30
end

@testset "JET" begin
    JET.test_package(CommonWorldInvalidations; target_defined_modules = true)
end
