#!/usr/bin/env lua
--- Odd/Even Closure Module
-- Demonstrates the use of closures to count odd and even numbers.
-- @module odd_even_closure

local M = {}

--- Creates a closure that counts odd and even numbers.
-- @return function A function that takes a number and updates the odd/even counters, returning both counts
function M.countOddEven()
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

--- Determines if a number is odd or even.
-- @param n number The number to check
-- @return string "odd" or "even" based on the number
function M.isOddOrEven(n)
    if n % 2 == 0 then
        return "even"
    else
        return "odd"
    end
end

-- Main execution
local function main()
    -- Create a counter function using the closure
    local counterFunction = M.countOddEven()
    local odd, even

    -- Count odd and even numbers from 1 to 1000
    for i = 1, 1000 do
        odd, even = counterFunction(i)
    end

    -- Print the total count of odd and even numbers
    print("Odd numbers: ", odd)
    print("Even numbers: ", even)

    -- Example usage of isOddOrEven
    local test_num = 42
    local message = string.format("Is odd or even %d: %s", test_num, M.isOddOrEven(test_num))
    print(message)
end

main()

return M

