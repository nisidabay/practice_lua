#!/usr/bin/lua
--
-- Factorial example

-- Function to calculate the factorial of a number
-- @param n The number to calculate the factorial of
-- @return The factorial of the number
local function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

-- Prompt the user to enter a number
io.write("Enter a number to calculate its factorial: ")
local input = io.read("*n")

if input then
    local result = factorial(input)
    print(string.format("The factorial of %d is %d", input, result))
else
    print("Invalid input. Please enter a valid number.")
end

