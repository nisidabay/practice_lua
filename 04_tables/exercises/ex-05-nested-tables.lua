#!/usr/bin/env lua
-- Exercise: Nested tables — Index into a matrix
--
-- Fill in the matrix indexing expressions to access specific elements
-- of a 2D table (a 3x3 matrix).

-- TODO: fill in the correct indices
local matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
}

-- Print the element at row 2, column 3 (should be 6)
print("matrix[2][3] =", matrix[nil][nil])

-- Print the diagonal elements: (1,1), (2,2), (3,3)
print("diagonal:", matrix[nil][nil], matrix[nil][nil], matrix[nil][nil])

-- Expected: matrix[2][3] = 6
-- Expected: diagonal: 1 5 9
-- Solution: see exercises.lua
