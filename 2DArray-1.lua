#!/usr/bin/env lua
---
--- This module demonstrates the creation and manipulation of a 2D array in Lua.
-- @module two_dimensional_array

--- Creates a 2D array with the given number of rows and columns.
-- Initializes all elements to the specified value (default is 0).
-- @param rows number The number of rows in the 2D array.
-- @param cols number The number of columns in the 2D array.
-- @param init_value any The initial value for all elements (default is 0).
-- @return table The created 2D array.
local function create2DArray(rows, cols, init_value)
    init_value = init_value or 0
    local array = {}
    for i = 1, rows do
        array[i] = {}
        for j = 1, cols do
            array[i][j] = init_value
        end
    end
    return array
end

--- Prints a 2D array to the console.
-- @param array table The 2D array to print.
local function print2DArray(array)
    for i = 1, #array do
        for j = 1, #array[i] do
            io.write(array[i][j], " ")
        end
        io.write("\n")
    end
end

-- Create a 3x3 2D array initialized to 0
local rows = 3
local cols = 3
local array2D = create2DArray(rows, cols)

-- Assign some values to the 2D array
array2D[1][1] = 1
array2D[1][2] = 2
array2D[1][3] = 3
array2D[2][1] = 4
array2D[2][2] = 5
array2D[2][3] = 6
array2D[3][1] = 7
array2D[3][2] = 8
array2D[3][3] = 9

-- Print the 2D array
print2DArray(array2D)

