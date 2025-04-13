local Vector = {}
-- Constructor method
Vector.__index = Vector -- Called when accessing a non-existent key

function Vector.new(x, y)
    local ins = { x = x or 0, y = y or 0 }
    return setmetatable(ins, Vector)
end

-- Basic methods
function Vector:magnitude()
    return math.sqrt(self.x ^ 2 + self.y ^ 2)
end

function Vector:normalize()
    local mag = self:magnitude()
    if mag > 0 then
        return Vector.new(self.x / mag, self.y / mag)
    end
    return Vector.new(0, 0)
end

function Vector:dot(other)
    return self.x * other.x + self.y * other.y
end

function Vector:angle()
    return math.atan(self.y, self.x)
end

-- Arithmetic metamethods
Vector.__add = function(a, b)
    return Vector.new(a.x + b.x, a.y + b.y)
end

Vector.__sub = function(a, b)
    return Vector.new(a.x - b.x, a.y - b.y)
end

Vector.__unm = function(a)
    return Vector.new(-a.x, -a.y)
end

Vector.__mul = function(a, b)
    if type(a) == "number" then
        return Vector.new(a * b.x, a * b.y)
    elseif type(b) == "number" then
        return Vector.new(b * a.x, b * a.y)
    else
        return a.x * b.x + a.y * b.y
    end
end

Vector.__div = function(a, scalar)
    return Vector.new(a.x / scalar, a.y / scalar)
end

-- Comparison metamethods
Vector.__eq = function(a, b) -- eq - Equality (==)
    return a.x == b.x and a.y == b.y
end

Vector.__lt = function(a, b) -- lt - Less than (<)
    return a:magnitude() < b:magnitude()
end

Vector.__le = function(a, b) -- le - Less than or equal to (<=)
    return a:magnitude() <= b:magnitude()
end

Vector.__gt = function(a, b) -- gt - Greater than (>)
    return a:magnitude() > b:magnitude()
end

Vector.__ge = function(a, b) -- ge - Greater than or equal to (>=)
    return a:magnitude() >= b:magnitude()
end

-- Call metamethod
Vector.__call = function(a, x, y)
    local dx = a.x - x
    local dy = a.y - y
    return math.sqrt(dx ^ 2 + dy ^ 2)
end

-- Other metamethods
Vector.__concat = function(a, b)
    return a.x .. b.x .. a.y .. b.y
end

Vector.__tostring = function(a)
    return "AAAA-Vector(" .. a.x .. ", " .. a.y .. ")"
end

-- Custom property access

local originalIndex = Vector.__index -- Store the original index
Vector.__index = function(table, key)
    -- Check for special keys
    if key == "magnitude" then
        return table:magnitude()
    elseif key == "normalized" then
        return table:normalize()
    elseif key == "angle" then
        return math.atan(table.y, table.x)
    else
        -- Fall back to the original behavior
        return originalIndex[key]
    end
end

Vector.__newindex = function(table, key, value)
    if key == "x" or key == "y" then
        rawset(table, key, value)
    elseif key == "angle" then
        -- Set angle while preserving magnitude
        local mag = table:magnitude()
        rawset(table, "x", mag * math.cos(value))
        rawset(table, "y", mag * math.sin(value))
    else
        error("Cannot set property: " .. key)
    end
end

local function demonstrateVector()
    print("=== Vector Demonstration ===")

    local v1 = Vector.new(3, 4)
    local v2 = Vector.new(1, 2)

    print("v1:", v1)
    print("v2:", v2)

    print("\n--- Arithmetic ---")
    print("v1 + v2:", v1 + v2)
    print("v1 - v2:", v1 - v2)
    print("-v1:", -v1)
    print("v1 * 2:", v1 * 2)
    print("3 * v2:", 3 * v2)
    print("v1 * v2 (dot):", v1 * v2)
    print("v1 / 2:", v1 / 2)

    print("\n--- Comparisons ---")
    print("v1 == v2:", v1 == v2)
    print("v1 == Vector.new(3, 4):", v1 == Vector.new(3, 4))
    print("v1 < v2:", v1 < v2)
    print("v2 < v1:", v2 < v1)
    print("v1 <= Vector.new(3, 4):", v1 <= Vector.new(3, 4))

    print("\n--- Properties ---")
    print("v1.magnitude:", v1.magnitude)
    print("v1.angle:", v1.angle)
    print("v1.normalized:", v1.normalized)

    print("\n--- Method calls ---")
    print("v1:magnitude():", v1:magnitude())
    print("v1:dot(v2):", v1:dot(v2))

    print("\n--- Call operator ---")
    print("v1(0, 0):", v1(0, 0))

    print("\n--- Property modification ---")
    local v3 = Vector.new(5, 0)
    print("Before: ", v3)
    v3.angle = math.pi / 4
    print("After v3.angle = π/4:", v3)

    print("\n=== End of Demonstration ===")
end

demonstrateVector()
