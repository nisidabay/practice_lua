#!/usr/sbin/lua
-- Prepend Number to String This code defines a table of functions
-- that prepend a number (in word form) to a given string. Each function
-- corresponds to a number in the 'numbers' list and returns a string with the
-- number prepended.

local numbers = { "one", "two", "three" }
PrependNumber = {}
for num, num_name in ipairs(numbers) do
	PrependNumber[num] = function(str)
		return num_name .. ": " .. str
	end
end
print(PrependNumber[1]("Hello"))
print(PrependNumber[2]("Lua"))
print(PrependNumber[3]("Weird"))
