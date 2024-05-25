#!/usr/bin/lua
-- Define a metatable for custom addition
local customMetatable = {
    __add = function(table1, table2)
        local result = {}
        for i = 1, #table1 do
            result[i] = table1[i] + table2[i]
        end
        return result
    end
}

-- Create two tables
local tableA = {1, 2, 3}
local tableB = {4, 5, 6}

-- Set the metatable for tableA
setmetatable(tableA, customMetatable)

-- Perform custom addition
local resultTable = tableA + tableB

-- Print the result
for _, value in ipairs(resultTable) do
    print(value)
end

