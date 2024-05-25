--
-- The matrix is initialized with given values and specific elements are printed.
-- This module demonstrates the creation and manipulation of a 2D array (matrix) in Lua.
-- @module matrix_example

-- Number of rows and columns for the matrix
local num_rows = 4
local num_cols = 4

-- List of values to populate the matrix
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

-- Initial value index to access elements from the values list
local value_index = 1

-- Create and initialize the matrix
local matrix = {} -- create new matrix
for i = 1, num_rows do
	matrix[i] = {} -- create new row
	for j = 1, num_cols do
		-- current element: row i, column j
		-- assign current value to element
		matrix[i][j] = values[value_index] -- assign element to column
		value_index = value_index + 1 -- move to next letter
	end
end

-- Print some elements
print(matrix[1][1]) -- Output: A
print(matrix[2][4]) -- Output: H
print(matrix[3][4]) -- Output: L

-- Optional: Function to print the entire matrix
local function printMatrix(mat)
	for i = 1, #mat do
		for j = 1, #mat[i] do
			io.write(mat[i][j], " ")
		end
		io.write("\n")
	end
end

-- Print the entire matrix (uncomment the following line to print the entire matrix)
printMatrix(matrix)
