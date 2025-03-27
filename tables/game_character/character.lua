local Character = {
    name = "",
    health = 0,
    level = 0,
    experience = 0
}

function Character:new(name, health)
    if type(name) ~= "string" or name == "" then
        error("Invalid name")
    end
    if type(health) ~= "number" or health <= 0 then
        error("Invalid health")
    end

    local obj = {
        name = name,
        health = health,
        level = 1,
        experience = 0,
        inventory = {}
    }
    setmetatable(obj, { __index = Character })
    return obj
end

function Character:levelUp()
    self.level = self.level + 1
end

local Warrior = {
    strength = 0,
    defense = 0
}
setmetatable(Warrior, { __index = Character })
function Warrior:new(name, health)
    local obj = Character:new(name, health)
    obj.strength = 10
    obj.defense = 5
    setmetatable(obj, { __index = Warrior })
    return obj
end

local Mage = {
    strength = 0,
    defense = 0
}
setmetatable(Mage, { __index = Character })
function Mage:new(name, health)
    local obj = Character:new(name, health)
    obj.strength = 8
    obj.defense = 8
    setmetatable(obj, { __index = Mage })
    return obj
end

local gameManager = require("tables/game_character/game_manager")
local warrior = Warrior:new("Conna", 100)
local mage = Mage:new("Merlin", 80)

gameManager.addCharacter(warrior)
gameManager.addCharacter(mage)
print(gameManager.battle(warrior, mage))
