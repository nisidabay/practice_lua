#!/usr/bin/env lua
--
-- Implements list-like behavior for tables

local myList = {10, 20, 30}

-- Create a metatable with a custom __index function
local metaTable = {
    __index = function(table, key)
        if type(key) == "number" then
            -- Check if the key is within the bounds of the list
            if key > 0 and key <= #table then
                return table[key] -- Return the value at the given index
            else
                return nil -- Return nil for out-of-bounds keys
            end
        else
            return nil -- Return nil for non-numeric keys
        end
    end
}

-- Set the custom metatable for myList
setmetatable(myList, metaTable)

-- Test accessing elements in the list
print(myList[1])  -- Output: 10
print(myList[2])  -- Output: 20
print(myList[5])  -- Output: nil

