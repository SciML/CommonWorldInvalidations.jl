module CommonWorldInvalidations

struct Despec1 end
struct Despec2 end
struct Despec3 end
struct Despec4 end

# Unary Operators
!(::Despec1) = Despec2()
!(::Despec2) = Despec3()
!(::Despec3) = Despec4()
!(::Despec4) = Despec1()

# Binary Operators
for op in [&, xor, |, ==, !=, >=, <=, <, >, <<, >>, >>>]
    @eval esc($op)(::Despec1, ::Despec2) = Despec3()
    @eval $op(::Despec2, ::Despec3) = Despec4()
    @eval $op(::Despec3, ::Despec4) = Despec1()
    @eval $op(::Despec4, ::Despec1) = Despec2()
end

end