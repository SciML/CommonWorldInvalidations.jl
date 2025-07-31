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

Base.convert(::Type{T}, ::Despec1) where T<:Real = one(T)
Base.convert(::Type{T}, ::Despec2) where T<:Real = one(T)
Base.convert(::Type{T}, ::Despec3) where T<:Real = one(T)
Base.convert(::Type{T}, ::Despec4) where T<:Real = one(T)

end