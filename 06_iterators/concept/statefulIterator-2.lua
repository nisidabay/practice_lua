#!/usr/bin/lua

--- Stateful iterator to generate squares of numbers.
-- @param iteratorMaxCount The maximum number for generating squares.
-- @param currentNumber The current number.
-- @return A function that, when called, returns the next number and its square.
local function square(iteratorMaxCount, currentNumber)
	return function()
		if currentNumber < iteratorMaxCount then
			currentNumber = currentNumber + 1
			return currentNumber, currentNumber * currentNumber
		end
	end
end

--- Create an iterator for squares with a maximum of 3.
local iterator = square(3, 0)

--- Iterate through the squares and print them.
print(iterator()) -- Output: 1    1^2
print(iterator()) -- Output: 2    2^2
