#!/usr/sbin/lua
--
-- Function definitions as assignments
--
-- Function `add1` defined using the `local function` syntax.
-- This function takes a variable number of arguments and returns their sum.
-- @param ... A variable number of arguments.
-- @return The sum of all the arguments.
local function add1(...)
	local sum = 0
	for _, value in ipairs({ ... }) do
		sum = sum + value
	end
	return sum
end

-- Function `add2` defined using the `local` assignment syntax.
-- This function takes a variable number of arguments and returns their sum.
-- @param ... A variable number of arguments.
-- @return The sum of all the arguments.
local add2 = function(...)
	local sum = 0
	for _, value in ipairs({ ... }) do
		sum = sum + value
	end
	return sum
end

-- Print the result of calling `add1` with arguments 1, 2, 3, 4.
print(add1(1, 2, 3, 4)) -- Output: 10

-- Print the result of calling `add2` with arguments 1, 2, 3, 4.
print(add2(1, 2, 3, 4)) -- Output: 10
