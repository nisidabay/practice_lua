#!/usr/bin/lua
--
-- Iterator example

-- Array of days
local days = { "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" }

-- Function that returns an iterator function (a closure)
local function createIterator(array)
    local index = 0
    return function()
        index = index + 1
        return array[index]
    end
end

-- Iterate over the array using the iterator function
for day in createIterator(days) do
    io.write(day, "  ")
end
