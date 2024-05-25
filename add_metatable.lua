#!/usr/bin/lua
--[[Explanation

    Metatable Definition: The customMetatable defines an __add metamethod to
    handle the addition operation between two tables.

    Tables Creation: tableA and tableB are created with the same length to
    ensure the addition operation works correctly.

    Setting Metatable: The metatable is set for tableA, so it can utilize the
    custom addition.

    Performing Addition: The custom addition is performed by tableA + tableB.

    Printing the Result: The result is printed using a loop with io.write to
    display the values in a single line. ]]

-- Define a metatable with an __add metamethod
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

-- Set the metatable for tableA
setmetatable(tableA, customMetatable)

-- Perform custom addition
local resultTable = tableA + tableB

-- Print the result
print("Sum of tableA and tableB:")
for _, value in ipairs(resultTable) do
	io.write(value, " ")
end
io.write("\n")
