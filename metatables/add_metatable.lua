#!/usr/bin/lua
--
-- Use of metatable

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

print("TableA")
for _, value in ipairs(tableA) do
	io.write(value, " ")
end
io.write("\n")

print("TableB")
for _, value in ipairs(tableB) do
	io.write(value, " ")
end
io.write("\n")

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
