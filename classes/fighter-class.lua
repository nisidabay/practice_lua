--------------------------------
-- Fighter Class Definition
-- This class represents a fighter with various attributes and methods
--------------------------------

-- Define the Fighter class
Fighter = {}
Fighter.__index = Fighter

-- Constructor to create a new Fighter object
-- @param attributes Table containing the initial attributes for the fighter
-- @return A new Fighter object
function Fighter:new(attributes)
    attributes = attributes or {}
    setmetatable(attributes, self)
    return attributes
end

-- Method to perform a light punch
function Fighter:light_punch()
    print("Fighter " .. self.name .. " performed a light punch")
end

-- Method to perform a strong punch
function Fighter:strong_punch()
    print("Fighter " .. self.name .. " performed a strong punch")
end

-- Method to perform a light kick
function Fighter:light_kick()
    print("Fighter " .. self.name .. " performed a light kick")
end

-- Method to perform a strong kick
function Fighter:strong_kick()
    print("Fighter " .. self.name .. " performed a strong kick")
end

-- Method to perform the special attack move
function Fighter:attack_move()
    print("Fighter " .. self.name .. " performed a " .. self.special_attack_name)
end

-- Create a fighter object for Blanka
local blanka = Fighter:new({
    name = "Blanka",
    country_of_origin = "Brazil",
    special_attack_name = "Electric shock",
    difficulty_level = 3,
})
print("Object " .. blanka.name .. " was created.")

-- Create a fighter object for Chun Li
local chun_li = Fighter:new({
    name = "Chun Li",
    country_of_origin = "China",
    special_attack_name = "Lightning kick",
    difficulty_level = 5,
})
print("Object " .. chun_li.name .. " was created.")

-- Call methods for Blanka
blanka:light_punch()
blanka:strong_kick()
blanka:attack_move()

-- Call methods for Chun Li
chun_li:light_punch()
chun_li:strong_kick()
chun_li:attack_move()
