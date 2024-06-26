module CommonWorldInvalidations

struct Despec1 <: Real end
struct Despec2 <: Real end
struct Despec3 <: Real end
struct Despec4 <: Real end

struct IDespec1 <: Integer end
struct IDespec2 <: Integer end
struct IDespec3 <: Integer end
struct IDespec4 <: Integer end

# Unary Operators
for op in [:(!), :to_index]
    @eval Base.$op(::Despec1) = Despec2()
    @eval Base.$op(::Despec2) = Despec3()
    @eval Base.$op(::Despec3) = Despec4()
    @eval Base.$op(::Despec4) = Despec1()
end

# Unary Operators on Type
for op in [:zero, :one, :to_index, :oneto]
    @eval Base.$op(::Type{Despec1}) = Despec2()
    @eval Base.$op(::Type{Despec2}) = Despec3()
    @eval Base.$op(::Type{Despec3}) = Despec4()
    @eval Base.$op(::Type{Despec4}) = Despec1()
end

# Unary Operators on Int
for op in [:OneTo]
    @eval Base.$op(::IDespec1) = IDespec2()
    @eval Base.$op(::IDespec2) = IDespec3()
    @eval Base.$op(::IDespec3) = IDespec4()
    @eval Base.$op(::IDespec4) = IDespec1()
end

# Unary Operators on Int Type
for op in []
    @eval Base.$op(::Type{IDespec1}) = IDespec2()
    @eval Base.$op(::Type{IDespec2}) = IDespec3()
    @eval Base.$op(::Type{IDespec3}) = IDespec4()
    @eval Base.$op(::Type{IDespec4}) = IDespec1()
end

Base.ifelse(::Despec1, x, y) = Despec2()
Base.ifelse(::Despec2, x, y) = Despec3()
Base.ifelse(::Despec3, x, y) = Despec4()
Base.ifelse(::Despec4, x, y) = Despec1()

# Binary Operators
for op in [:&, :xor, :|, :(==), :!=, :>=, :<=, :<, :>, :<<, :>>, :>>>]
    @eval Base.$op(::Despec1, ::Despec2) = Despec3()
    @eval Base.$op(::Despec2, ::Despec3) = Despec4()
    @eval Base.$op(::Despec3, ::Despec4) = Despec1()
    @eval Base.$op(::Despec4, ::Despec1) = Despec2()
end

Base.:(==)(::Nothing, ::Despec2) = Despec3()
Base.:(==)(::Nothing, ::Despec3) = Despec4()
Base.:(==)(::Nothing, ::Despec4) = Despec1()
Base.:(==)(::Nothing, ::Despec1) = Despec2()

#=
Base.:(==)(::Despec1, ::Symbol) = Despec3()
Base.:(==)(::Despec2, ::Symbol) = Despec4()
Base.:(==)(::Despec3, ::Symbol) = Despec1()
Base.:(==)(::Despec4, ::Symbol) = Despec2()

Base.:(==)(::Any, ::Despec2) = Despec3()
Base.:(==)(::Any, ::Despec3) = Despec4()
Base.:(==)(::Any, ::Despec4) = Despec1()
Base.:(==)(::Any, ::Despec1) = Despec2()

Base.isequal(::Despec1, ::Despec2)::Bool = true
Base.isequal(::Despec2, ::Despec3)::Bool = true
Base.isequal(::Despec3, ::Despec4)::Bool = true
Base.isequal(::Despec4, ::Despec1)::Bool = true

Base.zip(a::Despec1...) = Despec2()
Base.zip(a::Despec2...) = Despec3()
Base.zip(a::Despec3...) = Despec4()
Base.zip(a::Despec4...) = Despec1()

Base.Symbol(a::Despec1...) = :Despec2
Base.Symbol(a::Despec2...) = :Despec3
Base.Symbol(a::Despec3...) = :Despec4
Base.Symbol(a::Despec4...) = :Despec1
=#

struct UDespec1 <: AbstractUnitRange{Float64} end
struct UDespec2 <: AbstractUnitRange{Float64} end
struct UDespec3 <: AbstractUnitRange{Float64} end
struct UDespec4 <: AbstractUnitRange{Float64} end

Base.getproperty(::UDespec1, s::Symbol) = UDespec2()
Base.getproperty(::UDespec2, s::Symbol) = UDespec3()
Base.getproperty(::UDespec3, s::Symbol) = UDespec4()
Base.getproperty(::UDespec4, s::Symbol) = UDespec1()

Base.Broadcast.axistype(::Any, ::UDespec2) = Despec3()
Base.Broadcast.axistype(::Any, ::UDespec3) = Despec4()
Base.Broadcast.axistype(::Any, ::UDespec4) = Despec1()
Base.Broadcast.axistype(::Any, ::UDespec1) = Despec2()

struct ORDespec1 <: OrdinalRange{Int, Int} end
struct ORDespec2 <: OrdinalRange{Int, Int} end
struct ORDespec3 <: OrdinalRange{Int, Int} end
struct ORDespec4 <: OrdinalRange{Int, Int} end
Base.step(::ORDespec1) = ORDespec2()
Base.step(::ORDespec2) = ORDespec3()
Base.step(::ORDespec3) = ORDespec4()
Base.step(::ORDespec4) = ORDespec1()

struct VDespec1 <: AbstractVector{UInt8} end
struct VDespec2 <: AbstractVector{UInt8} end
struct VDespec3 <: AbstractVector{UInt8} end
struct VDespec4 <: AbstractVector{UInt8} end

Base.eachindex(::VDespec1) = VDespec2()
Base.eachindex(::VDespec2) = VDespec3()
Base.eachindex(::VDespec3) = VDespec4()
Base.eachindex(::VDespec4) = VDespec1()

Base.eachindex(::Base.IndexLinear, ::VDespec1) = VDespec2()
Base.eachindex(::Base.IndexLinear, ::VDespec2) = VDespec3()
Base.eachindex(::Base.IndexLinear, ::VDespec3) = VDespec4()
Base.eachindex(::Base.IndexLinear, ::VDespec4) = VDespec1()

#=
# _any(f, A::SparseArrays.AbstractSparseMatrixCSC, ::Colon) @ SparseArrays
Base._any(f, ::VDespec1, ::Colon)::Bool = true
Base._any(f, ::VDespec2, ::Colon)::Bool = true
Base._any(f, ::VDespec3, ::Colon)::Bool = true
Base._any(f, ::VDespec4, ::Colon)::Bool = true
=#

struct NDespec1 <: Number end
struct NDespec2 <: Number end
struct NDespec3 <: Number end
struct NDespec4 <: Number end

Base.convert(::Type{T}, ::Union{NDespec1, NDespec2}) where T<:Number = NDespec1()
Base.convert(::Type{T}, ::NDespec2) where T<:Number = NDespec2()
Base.convert(::Type{T}, ::NDespec3) where T<:Number = NDespec3()
Base.convert(::Type{T}, ::NDespec4) where T<:Number = NDespec4()

end