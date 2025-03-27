local Animal = {
    name = "",
    energy = 100,
}

function Animal:new(name)
    local obj = {
        name = name,
        energy = 100,
    }

    setmetatable(obj, { __index = Animal })
    return obj
end

function Animal:speak()
    print(self.name .. " make a sound!")
end

function Animal:eat()
    self.energy = self.energy + 10
    print(self.name .. " is eating. Energy: " .. self.energy)
end

local a = Animal:new("Dog")
a:speak()
a:eat()

local Dog = {}

setmetatable(Dog, { __index = Animal })

function Dog:new(name)
    local obj = Animal:new(name)
    setmetatable(obj, { __index = Dog })
    return obj
end

function Dog:speak()
    print(self.name .. " says barks!")
end

function Dog:wagTail()
    print(self.name .. " wags tail happyly!")
end

local d = Dog:new("Puppy")
d:speak()
d:wagTail()
d:eat()
d:eat()
