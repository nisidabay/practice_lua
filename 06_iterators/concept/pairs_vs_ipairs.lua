#!/usr/bin/env lua

--- Prints all elements of a table, including those with nil values.
-- @param tbl The table to iterate over.
local function do_not_skip(tbl)
    for index, number in pairs(tbl) do
        print("Index, number:", index, number)
    end
end

--- Prints elements of a table, stopping at the first nil value.
-- @param tbl The table to iterate over.
local function skip_at_nil(tbl)
    -- Stop at the first nil
    for index, number in ipairs(tbl) do
        print("Skipping at nil. Index, number:", index, number)
    end
end

-- Define a table with numbers, including a nil value
local numbers = {1, 2, 3, nil, 44}

-- Call the functions with the numbers table
do_not_skip(numbers)
skip_at_nil(numbers)

