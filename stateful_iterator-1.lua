#!/usr/bin/env lua
-- Returns an iterator that generates squares of numbers from 1 up to the
-- specified limit.
-- @param limit The upper limit for the numbers to be squared. Must be a
-- positive integer.
-- @return An iterator function that produces pairs of (number, square of the
-- number).
local function squares(limit)
	assert(limit > 0, "The limit must be a positive integer.")

	local currentNumber = 0
	return function()
		currentNumber = currentNumber + 1
		if currentNumber <= limit then
			return currentNumber, currentNumber * currentNumber
		end
	end
end

-- Example usage of the squares iterator.
-- Iterates over the squares of numbers from 1 to 3 and prints them.
for number, square in squares(3) do
	print(number, square)
end

-- Explanation:
-- This code is a stateful generator because it maintains the state of the
-- current number being squared between iterations. The `currentNumber`
-- variable is defined outside the anonymous function returned by `squares`.
-- Each time the iterator function is called, it updates `currentNumber` and
-- uses it to calculate the square. This state is preserved across calls to
-- the iterator function, allowing it to remember where it left off in the
-- sequence of numbers.
