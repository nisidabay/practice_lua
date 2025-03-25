#!/usr/bin/env lua
---
--- This module demonstrates the creation and manipulation of a 2D array in Lua.
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

local function print2DArray(array)
    for i = 1, #array do
        for j = 1, #array[i] do
            io.write(array[i][j], " ")
        end
        io.write("\n")
    end
end

local function addValues(array, values, row, col)
    for i = 1, row do
        for j = 1, col do
            array[i][j] = values[i][j]
        end
    end
    return array
end

-- Create a 3x3 2D array initialized to 0
local rows = 3
local cols = 3
local array2D = create2DArray(rows, cols)

-- Assign some values to the 2D array
local values = {
    { 1, 2, 3 },
    { 4, 5, 6 },
    { 7, 8, 9 }
}
array2D = addValues(array2D, values, rows, cols)

-- Print the 2D array
print2DArray(array2D)
