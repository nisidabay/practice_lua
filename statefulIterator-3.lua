#!/usr/bin/lua

--- Generates squares of numbers up to a specified maximum.
-- @param iteratorMaxCount The maximum number for generating squares.
-- @param currentNumber The current number.
-- @return The next number and its square.
local function square(iteratorMaxCount, currentNumber)
	return function()
		if currentNumber < iteratorMaxCount then
			currentNumber = currentNumber + 1
			return currentNumber, currentNumber * currentNumber
		end
	end
end

--- Iterate through the squares and print them.
local iterator = square(3, 0)
print(iterator())
print(iterator())
