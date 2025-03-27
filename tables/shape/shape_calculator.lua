local BaseShape = {}

function BaseShape:new()
    local obj = {}
    setmetatable(obj, { __index = BaseShape })
    return obj
end

function BaseShape:area()
    print("BaseShape area")
end

function BaseShape:perimeter()
    print("BaseShape perimeter")
end

function BaseShape:display()
    print("BaseShape display")
end

local Circle = {
    radius = 0
}

setmetatable(Circle, { __index = BaseShape })

function Circle:new(radius)
    if type(radius) ~= "number" or radius <= 0 then
        error("Invalid radius")
    end

    local obj = {
        radius = radius
    }

    setmetatable(obj, { __index = Circle })
    return obj
end

function Circle:area()
    return math.pi * self.radius * self.radius
end

function Circle:perimeter()
    return 2 * math.pi * self.radius
end

local Rectangle = {
    width = 0,
    height = 0
}
setmetatable(Rectangle, { __index = BaseShape })
function Rectangle:new(width, height)
    local obj = {
        width = width,
        height = height
    }
    setmetatable(obj, { __index = Rectangle })
    return obj
end

function Rectangle:area()
    return self.width * self.height
end

function Rectangle:perimeter()
    return 2 * (self.width + self.height)
end

local circle = Circle:new(5)     -- radius = 5
local rect = Rectangle:new(4, 6) -- width = 4, height = 6
print(circle:area())             -- Should print area of circle
print(rect:perimeter())          -- Should print perimeter of rectangle
