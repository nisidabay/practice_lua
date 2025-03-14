#!/usr/bin/env lua
--
-- tail call optimization
local function reverseString(input, accumulator)
	-- If the input string 'input' is empty, return the accumulated result 'accumulator'
	if #input < 1 then
		return accumulator
	end
	-- Get the first character of the string 'input'
	local firstChar = string.sub(input, 1, 1)
	-- Get the rest of the string 'input' excluding the first character
	local remainingString = string.sub(input, 2, -1)
	-- Recursively call 'reverseString' with the rest of the string and the accumulated result
	return reverseString(remainingString, firstChar .. accumulator)
end

-- Create a large string by repeating "hello" 5 times
local largeString = string.rep("hello", 5)
-- Print the reversed large string
print(reverseString(largeString, ""))
