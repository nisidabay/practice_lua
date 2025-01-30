#!/usr/bin/env lua

-- Define a table with initial data
local personTable = { name = "John", age = 30 }

-- Create a metatable with custom behaviors
local customMetatable = {
    -- Custom __index function to handle missing keys
    __index = function(_, key)
        return "Key '" .. key .. "' not found!"
    end,
    -- Custom __tostring function to provide a string representation
    __tostring = function(tbl)
        return "This is a custom table with name: " .. tbl.name
    end,
}

-- Set the custom metatable for the personTable
setmetatable(personTable, customMetatable)

-- Retrieve the metatable using getmetatable()
local retrievedMetatable = getmetatable(personTable)

-- Verify if the retrieved metatable matches the custom one
if retrievedMetatable == customMetatable then
    print("Metatable retrieved successfully!")
else
    print("Metatable retrieval failed!")
end

-- Access the table using custom behavior defined in the metatable
print(personTable.name) -- Output: John
print(personTable.age) -- Output: 30
print(personTable.city) -- Output: Key 'city' not found!

-- Use custom __tostring behavior defined in the metatable
print(tostring(personTable)) -- Output: This is a custom table with name: John

