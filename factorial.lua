#!/usr/bin/lua
--
-- Factorial tail recursive

-- Function to calculate the factorial of a number
-- @param n The number to calculate the factorial of
-- @param acc The acc to return
-- @return The factorial of the number
local function factorial(n, acc)
	acc = acc or 1
	if n < 0 then
		return nil
	elseif n == 0 then
		return acc
	else
		return factorial(n - 1, acc * n)
	end
end

-- Prompt the user to enter a number
io.write("Enter a number to calculate its factorial: ")
local input = io.read("*n")

if input and input >= 0 then
	print(string.format("The factorial of %d is %s", input, tostring(factorial(input))))
else
	print("Invalid input. Please enter a non-negative number.")
end
