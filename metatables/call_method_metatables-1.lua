#!/usr/bin/lua

-- Define a custom __call metamethod to calculate the sum of elements from two
-- tables
local function sumTables(table1, table2)
    local totalSum = 0

    -- Calculate the sum of elements in "table1"
    for _, value in ipairs(table1) do
        totalSum = totalSum + value
    end

    -- Calculate the sum of elements in "table2"
    for _, value in ipairs(table2) do
        totalSum = totalSum + value
    end

    return totalSum -- Return the sum of elements from both tables
end

-- Create a table "primaryTable" and set its metatable to use the custom __call metamethod
local primaryTable = setmetatable({ 10 }, { __call = sumTables })

-- Create a new table "secondaryTable"
local secondaryTable = { 10, 20, 30 }

-- Call "primaryTable" as if it were a function, passing "secondaryTable" as an
-- argument The custom __call metamethod is invoked to calculate and return the
-- sum of elements from both tables
print(primaryTable(secondaryTable))
