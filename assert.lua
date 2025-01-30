#!/usr/bin/lua
--
-- Use of assert

local function divide(a, b)
	assert(type(a) == "number" and type(b) == "number", "Inputs must be numbers.")
	assert(b ~= 0, "Division by zero is not allowed.")
	return a / b
end

-- Correct usage
local result = divide(10, 2)
print(result) -- Output: 5

-- This will throw an error because the second argument is 0
local badResult = divide(10, 0)
print(badResult)

-- This will throw an error because the second argument is not a number
local badInput = divide(10, "a")
print(badInput)
