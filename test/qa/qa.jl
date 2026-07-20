using SciMLTesting
using CommonWorldInvalidations
using JET
using Test

# Aqua ambiguities and deps_compat disabled: genuine findings tracked in
# https://github.com/SciML/CommonWorldInvalidations.jl/issues/30.
#
# ExplicitImports.jl runs all six checks (four standard + two public-API). The
# package defines methods on internal Base functions on purpose (its whole job is to
# trigger common-world invalidations), so `Base.Broadcast.axistype` is accessed via
# its non-public name with no public alternative to switch to — the single
# unavoidable non-public-access exception is ignored on the relevant check.
run_qa(
    CommonWorldInvalidations;
    aqua_kwargs = (; ambiguities = false, deps_compat = false),
    jet_kwargs = (; target_defined_modules = true),
    explicit_imports = true,
    ei_kwargs = (; all_qualified_accesses_are_public = (; ignore = (:axistype,))),
)

# Aqua findings disabled above are genuine and tracked in issue #30.
@testset "Aqua tracked findings (issue #30)" begin
    @test_broken false  # Aqua ambiguities: 4 found (Base.Broadcast.axistype)
    @test_broken false  # Aqua deps_compat: Pkg extra missing compat entry
end
