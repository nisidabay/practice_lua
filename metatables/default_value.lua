#!/usr/sbin/lua

-- Define a table that will use a metatable to provide default values
local myTable = {}

-- Create a metatable with a custom __index function
-- The __index function returns a default value when a key is not found in the
-- table
myTable ={name="John",age=30}

local defaultMetatable = {
    __index = function(_, _)
        return "default" -- Return the default value for any missing key
    end,
}

-- Set the custom metatable for myTable
setmetatable(myTable, defaultMetatable)

-- Attempt to access a non-existent key, which triggers the __index function
print(myTable.somekey) -- Output: default
print(myTable.name) -- Output: John
