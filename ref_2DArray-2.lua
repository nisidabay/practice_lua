#!/usr/bin/env lua
--
-- The matrix is initialized with given values and specific elements are
-- printed. This module demonstrates the creation and manipulation of a 2D array
-- (matrix) in Lua.
-- @module matrix_example

-- Matrix Example Module
-- This module demonstrates the creation and manipulation of a 2D array (matrix) in Lua.

-- Function to validate the elements and size of the matrix
local function validateMatrix(num_rows, num_cols, values)
	if #values ~= num_rows * num_cols then
		print("The matrix doesn't match")
		os.exit(1)
	end
end

-- Function to create and initialize a matrix with given values
local function createMatrix(num_rows, num_cols, values)
	local matrix = {}
	local value_index = 1
	validateMatrix(num_rows, num_cols, values)
	for i = 1, num_rows do
		matrix[i] = {}
		for j = 1, num_cols do
			matrix[i][j] = values[value_index]
			value_index = value_index + 1
		end
	end

	return matrix
end


-- Function to print the entire matrix
local function printMatrix(mat)
	for i = 1, #mat do
		for j = 1, #mat[i] do
			io.write(mat[i][j], " ")
		end
		io.write("\n")
	end
end

-- Main execution
local num_rows = 4
local num_cols = 4
local values = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
}

local matrix = createMatrix(num_rows, num_cols, values)

-- Print specific elements
print("Print only some indexes: ")
print(matrix[1][1]) -- Output: A
print(matrix[2][4]) -- Output: H
print(matrix[3][4]) -- Output: L

-- Print the entire matrix
print("\nEntire Matrix:")
printMatrix(matrix)
