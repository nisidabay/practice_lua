#!/usr/bin/lua
print("Enter the number of rows: ")
local num_rows = tonumber(io.read("*line"))

print("Enter the number of columns: ")
local num_cols = tonumber(io.read("*line"))

if not num_rows or not num_cols then
	print("Invalid input. Please enter valid numbers for rows and columns.")
	os.exit(1)
end

local matrix = {}

-- Create the matrix
for i = 1, num_rows do
	matrix[i] = {}
	for j = 1, num_cols do
		matrix[i][j] = i * j
	end
end

-- Print the matrix as a grid
for i = 1, num_rows do
	for j = 1, num_cols do
		io.write(matrix[i][j]) -- Use io.write to print without newline
		if j < num_cols then
			io.write("\t") -- Add tab as a separator between columns
		end
	end
	io.write("\n") -- Add a newline after each row
end
