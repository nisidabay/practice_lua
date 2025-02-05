-- Fighter Class Definition
-- This class represents a fighter with various attributes and methods
--------------------------------

-- Define the Fighter class
local Fighter = {}
Fighter.__index = Fighter

-- Constructor to create a new Fighter object
-- @param attributes Table containing the initial attributes for the fighter
-- @return A new Fighter object
function Fighter:new(attributes)
    local obj = {}
    setmetatable(obj, self)

    -- Private attributes table
    obj._attributes = {
        name = attributes.name or "Unknown",
        country_of_origin = attributes.country_of_origin or "Unknown",
        special_attack_name = attributes.special_attack_name or "Unknown",
        difficulty_level = attributes.difficulty_level or 1,
    }

    return obj
end

-- Getter for name
function Fighter:get_name()
    return self._attributes.name
end

-- Setter for name
function Fighter:set_name(name)
    self._attributes.name = name
end

-- Getter for country_of_origin
function Fighter:get_country_of_origin()
    return self._attributes.country_of_origin
end

-- Setter for country_of_origin
function Fighter:set_country_of_origin(country_of_origin)
    self._attributes.country_of_origin = country_of_origin
end

-- Getter for special_attack_name
function Fighter:get_special_attack_name()
    return self._attributes.special_attack_name
end

-- Setter for special_attack_name
function Fighter:set_special_attack_name(special_attack_name)
    self._attributes.special_attack_name = special_attack_name
end

-- Getter for difficulty_level
function Fighter:get_difficulty_level()
    return self._attributes.difficulty_level
end

-- Setter for difficulty_level
function Fighter:set_difficulty_level(difficulty_level)
    self._attributes.difficulty_level = difficulty_level
end

-- Method to perform a light punch
function Fighter:light_punch()
    print("Fighter " .. self:get_name() .. " performed a light punch")
end

-- Method to perform a strong punch
function Fighter:strong_punch()
    print("Fighter " .. self:get_name() .. " performed a strong punch")
end

-- Method to perform a light kick
function Fighter:light_kick()
    print("Fighter " .. self:get_name() .. " performed a light kick")
end

-- Method to perform a strong kick
function Fighter:strong_kick()
    print("Fighter " .. self:get_name() .. " performed a strong kick")
end

-- Method to perform the special attack move
function Fighter:attack_move()
    print("Fighter " .. self:get_name() .. " performed a " .. self._attributes.special_attack_name)
end

-- Create a fighter object for Blanka
local blanka = Fighter:new({
    name = "Blanka",
    country_of_origin = "Brazil",
    special_attack_name = "Electric shock",
    difficulty_level = 3,
})
print("Object " .. blanka:get_name() .. " was created.")

-- Create a fighter object for Chun Li
local chun_li = Fighter:new({
    name = "Chun Li",
    country_of_origin = "China",
    special_attack_name = "Lightning kick",
    difficulty_level = 5,
})
print("Object " .. chun_li:get_name() .. " was created.")

-- Call methods for Blanka
blanka:light_punch()
blanka:strong_kick()
blanka:attack_move()

-- Call methods for Chun Li
chun_li:light_punch()
chun_li:strong_kick()
chun_li:attack_move()
