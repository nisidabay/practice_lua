#!/usr/bin/env lua
--
-- Factorial using tail calls
local function factorial_helper(n, acc)
	if n == 0 then
		return acc
	else
		print("accumulator is: ", acc)
		return factorial_helper(n - 1, n * acc)
	end
end

local function factorial(n)
	return factorial_helper(n, 1)
end

io.write("Factorial of: ")
local num = io.read("l")
if num then
	print(factorial(num))
end
