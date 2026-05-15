#!/usr/bin/env lua
--- Two-Dimensional Array Module
-- Provides functions for creating and manipulating 2D arrays in Lua.
-- @module two_dimensional_array

local M = {}

--- Creates a 2D array with the specified dimensions.
-- @param rows number The number of rows
-- @param cols number The number of columns
-- @param init_value any The initial value for all elements (default: 0)
-- @return table A 2D array (table of tables)
function M.create2DArray(rows, cols, init_value)
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
-- @param array table The 2D array to print
function M.print2DArray(array)
    for i = 1, #array do
        for j = 1, #array[i] do
            io.write(array[i][j], " ")
        end
        io.write("\n")
    end
end

--- Sets a value at a specific position in the 2D array.
-- @param array table The 2D array
-- @param row number The row index
-- @param col number The column index
-- @param value any The value to set
function M.setValue(array, row, col, value)
    if array[row] and array[row][col] then
        array[row][col] = value
    else
        error("Invalid row or column index")
    end
end

--- Gets a value from a specific position in the 2D array.
-- @param array table The 2D array
-- @param row number The row index
-- @param col number The column index
-- @return any The value at the specified position
function M.getValue(array, row, col)
    if array[row] and array[row][col] then
        return array[row][col]
    else
        error("Invalid row or column index")
    end
end

-- Main execution (demonstration)
local function main()
    -- Create a 3x3 2D array initialized to 0
    local array2D = M.create2DArray(3, 3)

    -- Assign values using nested loops
    local value = 1
    for i = 1, 3 do
        for j = 1, 3 do
            M.setValue(array2D, i, j, value)
            value = value + 1
        end
    end

    -- Print the 2D array
    M.print2DArray(array2D)
end

main()

