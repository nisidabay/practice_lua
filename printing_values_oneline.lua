--
--
-- Printing values in one line
local customMetatable = {
    __add = function(table1, table2)
        if #table1 == #table2 then
            local result = {}
            for i = 1, #table1 do
                result[i] = table1[i] + table2[i]
            end
            return result
        else
            print("The tables are different in size!")
            os.exit(1)
        end
    end,
}

-- Create two tables
local tableA = { 1, 2, 10 }
local tableB = { 4, 5, 6 }

-- Function to print table values in one line
local function printTableValues(tbl, name)
    print(name.." "..table.concat(tbl, " "))
end

-- Print table values
printTableValues(tableA, "TableA")
printTableValues(tableB, "TableB")

-- Set the metatable for tableA
setmetatable(tableA, customMetatable)

-- Perform custom addition
local resultTable = tableA + tableB

-- Print the result
printTableValues(resultTable, "Sum of tableA and tableB is:")

