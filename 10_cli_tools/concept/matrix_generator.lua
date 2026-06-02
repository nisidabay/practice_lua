#!/usr/bin/lua
--
-- Matrix multiplication table generator

-- Function to read a number from user input
local function readNumber(prompt)
    print(prompt)
    local number = tonumber(io.read("*line"))
    if not number then
        print("Invalid input. Please enter a valid number.")
        os.exit(1)
    end
    return number
end

-- Function to print the matrix as a grid
local function printMatrix(mat, Rows, Cols)
    for i = 1, Rows do
        for j = 1, Cols do
            io.write(mat[i][j]) -- Print each element
            if j < Cols then
                io.write("\t") -- Add tab as a separator between columns
            end
        end
        io.write("\n") -- Add a newline after each row
    end
end

-- Main function to encapsulate the logic
local function main()
    -- Read the number of rows and columns from the user
    local numRows = readNumber("Enter the number of rows: ")
    local numCols = readNumber("Enter the number of columns: ")

    -- Initialize the matrix
    local matrix = {}

    -- Populate the matrix with multiplication values
    for i = 1, numRows do
        matrix[i] = {}
        for j = 1, numCols do
            matrix[i][j] = i * j
        end
    end

    -- Print the matrix
    printMatrix(matrix, numRows, numCols)
end

-- Call the main function
main()
