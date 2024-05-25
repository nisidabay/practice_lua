#!/usr/bin/lua
--
-- Define an array of days of the week

local days = { "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday" }

-- Define a function that returns an iterator function (a closure)
local function walk(array)
	-- Initialize an index variable to keep track of the current position in the array
	local index = 0
	-- Return an iterator function
	return function()
		-- Increment the index by 1
		index = index + 1
		-- Return the element at the current index position in the array
		return array[index]
	end
end

-- Use a for loop to iterate over the array using the iterator function returned by walk(days)
for day in walk(days) do
	-- Print each day followed by two spaces
	io.write(day, "  ")
end
