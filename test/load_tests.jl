using CommonWorldInvalidations
using Test

@testset "Load" begin
    @test CommonWorldInvalidations isa Module
    @test axes(CommonWorldInvalidations.UDespec1()) isa CommonWorldInvalidations.UDespec2
end
