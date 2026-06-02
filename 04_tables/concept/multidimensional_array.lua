#!/usr/bin/lua
-- Create a 2D array with 3 rows and 4 columns
local rows = 3
local columns = 4
local multidimensionalArray = {}

-- Initialize the array with values
for i = 1, rows do
    multidimensionalArray[i] = {} -- Create a new row
    for j = 1, columns do
        multidimensionalArray[i][j] = 0 -- Initialize each element to 0
    end
end

-- Access and modify elements
multidimensionalArray[1][2] = 42
multidimensionalArray[2][3] = 123

-- Print the array
for i = 1, rows do
    for j = 1, columns do
        io.write(multidimensionalArray[i][j], " ")
    end
    io.write("\n")
end

