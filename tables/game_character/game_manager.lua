local GameManager = {
    characters = {},
    _validateCharacter = function(c)
        if c.name == nil or c.name == "" then
            return false
        end
        return true
    end,

    _validateHealth = function(c)
        if c.health < 0 then
            return false
        end
        return true
    end
}

function GameManager.addCharacter(character)
    if not GameManager._validateCharacter(character) or not GameManager._validateHealth(character) then
        error("Invalid character")
    end

    GameManager.characters[character.name] = character
end

function GameManager.battle(c1, c2)
    if not GameManager._validateCharacter(c1) or not GameManager._validateCharacter(c2) then
        error("Invalid character")
    end

    if not GameManager.characters[c1.name] or not GameManager.characters[c2.name] then
        error("One of the characters is not registered")
    end

    if c1.health <= 0 or c2.health <= 0 then
        error("One of the characters is dead")
    end

    local round = 1
    while c1.health > 0 and c2.health > 0 do
        print("Round " .. round)
        -- Calculate damage based on strength/defense
        local damage1 = math.max(0, c1.strength - c2.defense)
        local damage2 = math.max(0, c2.strength - c1.defense)

        c2.health = c2.health - damage1
        c1.health = c1.health - damage2

        round = round + 1
    end

    -- Determine winner
    if c1.health <= 0 then
        return c2.name .. " wins!"
    elseif c2.health <= 0 then
        return c1.name .. " wins!"
    else
        return "Draw!"
    end
end

return GameManager
