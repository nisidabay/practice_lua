#!/usr/bin/lua
-- Lua script to calculate the average of a set of numbers.

-- Function to calculate the average of a variable number of arguments.
-- @param ... A variable number of numerical arguments.
-- @return The average of the provided numbers.
local function average(...)
    local result = 0
    local args = {...}  -- Pack the arguments into a table.
    for _, v in pairs(args) do
        result = result + v
    end
    return result / #args  -- Calculate the average.
end

-- Calculate and print the average of the provided numbers.
print("The average is: " .. average(10, 5, 35))
