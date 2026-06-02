#!/usr/bin/lua

-- Define a table representing a person with initial attributes
local person = {
    name = "Peter",
    age = 59,
}

-- Create a metatable with a custom __index function
-- The purpose of __index is to handle cases when a key is not found in the table
local personMetatable = {
    __index = function(_, key)
        print("Key not found: " .. key)
    end,
}

-- Set the custom metatable for the person table
setmetatable(person, personMetatable)

-- Access existing keys in the person table
print("Name:", person.name) -- Output: Name: Peter
print("Age:", person.age)   -- Output: Age: 59

-- Attempt to access a non-existent key, triggering the __index function
print("City:", person.city) -- Output: Key not found: city
