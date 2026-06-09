using CommonWorldInvalidations
using Aqua
using JET
using Test

@testset "Aqua" begin
    Aqua.test_all(CommonWorldInvalidations)
end

@testset "JET" begin
    JET.test_package(CommonWorldInvalidations; target_defined_modules = true)
end
