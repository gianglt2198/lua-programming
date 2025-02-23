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
