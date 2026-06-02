#!/usr/bin/lua
-- Lua script to calculate the sum of numbers entered by the user.

-- Prompt the user to enter some numbers, separated by spaces.
print("Enter some numbers separated by spaces: ")

-- Read the user's input and split it into numbers.
local input = io.read("*line")  -- Read a whole line of input.
local numbers = {}  -- Create an empty table to store the numbers.

-- Split the input string into numbers.
for value in input:gmatch("%S+") do
    -- Try to convert the input to a number and add it to the 'numbers' table.
    local converted_num = tonumber(value)
    if converted_num then
        table.insert(numbers, converted_num)
    else
        -- If conversion fails, print an error message and stop.
        print("Arguments must be numbers.")
        os.exit(1)  -- Exit the script with an error code.
    end
end

-- Calculate the sum of the numbers.
local sum = 0
for _, v in pairs(numbers) do
    sum = sum + v
end

-- Print the result.
print("The sum of the numbers is: " .. sum)
