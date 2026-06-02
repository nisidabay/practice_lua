#!/usr/bin/lua
--
-- This script calculates the factorial of a non-negative number
-- using a tail-recursive approach. Tail recursion is an optimization
-- where the recursive call is the very last action in the function,
-- allowing the Lua interpreter to reuse the same stack frame,
-- preventing stack overflow for large inputs.

-- Defines a tail-recursive function to calculate the factorial.
-- @param n The number to calculate the factorial of.
-- @param acc (Internal) The accumulator, used to store the intermediate product.
--        This parameter is for internal use by the recursion and is not meant
--        to be provided by the user on the initial call. If it's not provided,
--        it defaults to 1, the multiplicative identity.
-- @return The factorial of the number, or nil if the input is negative.
local function factorial(n, acc)
	-- Initialize the accumulator to 1 on the first call.
	acc = acc or 1
	if n < 0 then
		-- Factorial is not defined for negative numbers.
		return nil
	elseif n == 0 then
		-- Base case: when n reaches 0, the accumulator holds the final result.
		return acc
	else
		-- The recursive step: call the function with the next number (n-1)
		-- and update the accumulator by multiplying it with the current number (n).
		-- This is a "tail call" because it's the last operation in the function.
		print(string.format("The accumuator is %s", acc))
		return factorial(n - 1, acc * n)
	end
end

-- Prompt the user to enter a number.
io.write("Enter a number to calculate its factorial: ")
-- Read the input as a number.
local input = io.read("*n")

-- Validate the user input.
if input and input >= 0 then
	-- If the input is a valid non-negative number, calculate and print the factorial.
	-- Note that we only pass the input number to the `factorial` function.
	-- The `acc` parameter is handled internally by the function itself.
	print(string.format("The factorial of %d is %s", input, tostring(factorial(input))))
else
	-- If the input is invalid, print an error message.
	print("Invalid input. Please enter a non-negative number.")
end
