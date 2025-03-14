#!/usr/bin/env lua

-- This script demonstrates the use of closures to count odd and even numbers
-- and a function to determine if a number is odd or even.

-- Function that returns a closure to count odd and even numbers
-- @return A function that takes a number and updates the odd/even counters
local function countOddEven()
    local odd_counter = 0
    local even_counter = 0
    return function(value)
        if value % 2 == 0 then
            even_counter = even_counter + 1
        else
            odd_counter = odd_counter + 1
        end
        return odd_counter, even_counter
    end
end

-- Create a counter function using the closure
local counterFunction = countOddEven()
local odd
local even

-- Count odd and even numbers from 1 to 1000
for i = 1, 1000 do
    odd, even = counterFunction(i)
end

-- Print the total count of odd and even numbers
print("Odd numbers: ", odd)
print("Even numbers: ", even)

-- Function to determine if a number is odd or even
-- @param n The number to check
-- @return A string "odd" or "even" based on the number
local function isOddOrEven(n)
    if n % 2 == 0 then
        return "even"
    else
        return "odd"
    end
end

io.write("Enter a number: ")
local num = io.read("*n")
local message = string.format("Is odd or even %d: %s", num, isOddOrEven(num))
print(message)

