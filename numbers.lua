print(0.3e-1) -- 0.03
print(5E+5)   -- 500000
print(5e+2)   -- 500
print(string.format("%a", 4))
print(3.2 + 1)
-- floor division
print(3 // 2)
-- modulo
print(5 % 3)
-- --- some unexpected cases
x = math.pi
print(x - x % 0.01)
print(x - x % 0.001)

-- local tolerance = 10
-- function isturnback(angle)
--     angle = angle % 360
--     return (math.abs(angle - 180) < tolerance)
-- end

local tolerance = 0.17
function isturnback(angle)
    angle = angle % (2 * math.pi)
    return (math.abs(angle - math.pi) < tolerance)
end

print(isturnback(1))
-- the different way to implement != not equal in lua: ~=
print(10 ~= -10) -- true
print(10 ~= 10)  -- false

-- Random
-- three ways to call
-- math.random() for [0, 1)
-- math.random(n) for [1, n]
-- math.random(l, r) for [l, r]
print(math.randomseed(os.time()))

-- rounding funcs
print(math.floor(3.9))
print(math.floor(-3.6))
print(math.ceil(3.9))
print(math.ceil(-3.6))
print(math.modf(3.9))
print(math.modf(-3.6))
function round(x)
    local f = math.floor(x)
    if x == f then
        return f
    else
        return math.floor(x + 0.5)
    end
end

print(round(3.5))
-- unbiased rounding
function unbiasedround(x)
    local f = math.floor(x)
    if (x == f) or (x % 2 == 0.5) then
        return f
    else
        return math.floor(x + 0.5)
    end
end

print(unbiasedround(2.5))
print(unbiasedround(3.5))
print(1 / 7 * 7)
print(12.3 - 20 + 7.7)
print(3.0 | 0)
print(math.tointeger(3.0))

-- 3.1 valid numerals
print(.0e12)      --> 0.0
print(0x12)       --> 18
print(0xA)        --> 10
print(0xFFFFFFFF) --> 4294967295 maxinteger
print(0x1P10)     --> 1024.0
print(0.1e1)      --> 1.0
print(0x0.1p1)    --> 0.125

-- 3.2 integer arthmetic
-- 1. math.maxinteger * 2 --> (math.maxinteger + 1) --> math.mininteger + (math.maxinteger - 1) --> -2
-- 2. math.mininteger * 2 --> (math.mininteger - 1) --> math.maxinteger + (math.minintegr + 1) --> 0
-- 3.

-- 3.3 program print
-- print from -10 to 10 and 2 0 1

-- 3.4 the result of 2^3^4 = 2^(3^4) = 2^81 out of range integer 2^63 (wrap round)

-- 3.5 12.7 is equal to the fraction 25.4/2, where the denominator is a power of two
-- the number 5.5 is equal to the fraction 11/2

-- 3.6 a function to compute the volume of a right circular cone
function volumOfCircularCone(h, a)
    local ar = a * (math.pi / 180)

    local r = h * math.tan(ar)

    return (1 / 3) * math.pi * r ^ 2 * h
end

print(volumOfCircularCone(10, 30))

-- 3.7 write function to produce a pseudo-random number with a standard normal distribution
-- Apply Box-Muller transform
function normalRandom()
    local u1 = math.random()
    local u2 = math.random()

    local z = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)
    return z
end

math.randomseed(os.time())

print(normalRandom())
