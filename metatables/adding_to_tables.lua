#!/usr/bin/env lua
--
-- Create a table with custom metatable

-- Define a function to create a table with a custom metatable
local function add_table(...)
	local mytable = setmetatable({ ... }, {
		__add = function(table1, table2)
			-- Check if both inputs are tables
			assert(type(table1) == "table", "First operand is not a table")
			assert(type(table2) == "table", "Second operand is not a table")

			-- Create a new table to hold the result
			local result = {}
			-- Copy all elements from the first table into the result
			for i = 1, #table1 do
				result[i] = table1[i]
			end
			local resultLength = #result
			-- Append all elements from the second table into the result
			for i = 1, #table2 do
				result[resultLength + i] = table2[i]
			end
			return result -- Return the combined table
		end,
	})
	return mytable -- Return the new table with the custom metatable
end

-- Create the first table with a custom metatable
local first_table = add_table(1, 2, 3) -- Pass individual elements
-- Create a second table "second_table"
local second_table = { 4, 5, 6 }

-- Perform the custom addition by using the "+" operator
first_table = first_table + second_table

-- Print the extended table
print("Extended table:")
for _, v in ipairs(first_table) do
	io.write(v, " ")
end
io.write("\n") -- Print newline for clean output
