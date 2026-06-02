#!/usr/bin/env lua
--
-- Find max number with variadic arguments
--

--- Function to find the maximum number from a list of numbers.
-- @param ... A variable number of numeric arguments.
-- @return The maximum number and its position in the argument list.
local function find_max(...)
    -- Initialize the counter for the position of the max number
    local counter = 0
    -- Collect all arguments into a table
    local arguments = { ... }
    -- Assume the first argument is the maximum initially
    local max = arguments[1]

    -- Iterate over all arguments to find the maximum
    for i, num in ipairs(arguments) do
        if num > max then
            max = num
            counter = i
        end
    end

    -- Return the maximum number and its position
    return max, counter
end

-- Call the function with a list of numbers and print the result
local max, counter = find_max(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 100, 16, 17, 18, 19, 20)
print("Max number is " .. max .. " at position " .. counter)
