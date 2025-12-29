using AllocCheck
using CommonWorldInvalidations

@testset "AllocCheck - Zero Allocations" begin
    @testset "Unary operators on Despec types" begin
        # @check_allocs will throw AllocCheckFailure if function allocates
        # We wrap in @test to make them proper tests
        @test begin
            @check_allocs not_d1(x::CommonWorldInvalidations.Despec1) = !x
            not_d1(CommonWorldInvalidations.Despec1())
            true
        end
        @test begin
            @check_allocs not_d2(x::CommonWorldInvalidations.Despec2) = !x
            not_d2(CommonWorldInvalidations.Despec2())
            true
        end
        @test begin
            @check_allocs not_d3(x::CommonWorldInvalidations.Despec3) = !x
            not_d3(CommonWorldInvalidations.Despec3())
            true
        end
        @test begin
            @check_allocs not_d4(x::CommonWorldInvalidations.Despec4) = !x
            not_d4(CommonWorldInvalidations.Despec4())
            true
        end
        @test begin
            @check_allocs to_idx_d1(x::CommonWorldInvalidations.Despec1) = Base.to_index(x)
            to_idx_d1(CommonWorldInvalidations.Despec1())
            true
        end
    end

    @testset "Binary operators on Despec types" begin
        @test begin
            @check_allocs eq_d12(x::CommonWorldInvalidations.Despec1, y::CommonWorldInvalidations.Despec2) = x == y
            eq_d12(CommonWorldInvalidations.Despec1(), CommonWorldInvalidations.Despec2())
            true
        end
        @test begin
            @check_allocs lt_d12(x::CommonWorldInvalidations.Despec1, y::CommonWorldInvalidations.Despec2) = x < y
            lt_d12(CommonWorldInvalidations.Despec1(), CommonWorldInvalidations.Despec2())
            true
        end
        @test begin
            @check_allocs and_d12(x::CommonWorldInvalidations.Despec1, y::CommonWorldInvalidations.Despec2) = x & y
            and_d12(CommonWorldInvalidations.Despec1(), CommonWorldInvalidations.Despec2())
            true
        end
        @test begin
            @check_allocs or_d12(x::CommonWorldInvalidations.Despec1, y::CommonWorldInvalidations.Despec2) = x | y
            or_d12(CommonWorldInvalidations.Despec1(), CommonWorldInvalidations.Despec2())
            true
        end
        @test begin
            @check_allocs xor_d12(x::CommonWorldInvalidations.Despec1, y::CommonWorldInvalidations.Despec2) = xor(x, y)
            xor_d12(CommonWorldInvalidations.Despec1(), CommonWorldInvalidations.Despec2())
            true
        end
    end

    @testset "ifelse on Despec types" begin
        @test begin
            @check_allocs ifelse_d1(x::CommonWorldInvalidations.Despec1, a::Int, b::Int) = ifelse(x, a, b)
            ifelse_d1(CommonWorldInvalidations.Despec1(), 1, 2)
            true
        end
    end

    @testset "convert on Despec types" begin
        @test begin
            @check_allocs conv_d1(::Type{Float64}, x::CommonWorldInvalidations.Despec1) = convert(Float64, x)
            conv_d1(Float64, CommonWorldInvalidations.Despec1())
            true
        end
    end

    @testset "OneTo on IDespec types" begin
        @test begin
            @check_allocs oneto_id1(x::CommonWorldInvalidations.IDespec1) = Base.OneTo(x)
            oneto_id1(CommonWorldInvalidations.IDespec1())
            true
        end
    end

    @testset "getproperty on UDespec types" begin
        @test begin
            @check_allocs getprop_ud1(x::CommonWorldInvalidations.UDespec1) = getproperty(x, :stop)
            getprop_ud1(CommonWorldInvalidations.UDespec1())
            true
        end
    end

    @testset "eachindex on VDespec types" begin
        @test begin
            @check_allocs eachidx_vd1(x::CommonWorldInvalidations.VDespec1) = eachindex(x)
            eachidx_vd1(CommonWorldInvalidations.VDespec1())
            true
        end
    end

    @testset "step on ORDespec types" begin
        @test begin
            @check_allocs step_or1(x::CommonWorldInvalidations.ORDespec1) = step(x)
            step_or1(CommonWorldInvalidations.ORDespec1())
            true
        end
    end

    @testset "Broadcast.axistype on UDespec types" begin
        @test begin
            @check_allocs axis_ud1(x::Int, y::CommonWorldInvalidations.UDespec1) = Base.Broadcast.axistype(x, y)
            axis_ud1(1, CommonWorldInvalidations.UDespec1())
            true
        end
    end

    @testset "== with Nothing" begin
        @test begin
            @check_allocs eq_nothing_d1(x::Nothing, y::CommonWorldInvalidations.Despec1) = x == y
            eq_nothing_d1(nothing, CommonWorldInvalidations.Despec1())
            true
        end
    end
end
