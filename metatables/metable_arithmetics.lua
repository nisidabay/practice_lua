#!/usr/bin/lua
--
-- Define metatable arithmetic operations

-- Function to check table sizes
local function checkTableSizes(table1, table2)
	if #table1 ~= #table2 then
		print("The tables are different in size!")
		os.exit(1)
	end
end

-- Metatable for addition
local addition = {
	__add = function(table1, table2)
		checkTableSizes(table1, table2)
		local result = {}
		for i = 1, #table1 do
			result[i] = table1[i] + table2[i]
		end
		return result
	end,
}

-- Metatable for subtraction
local subtraction = {
	__sub = function(table1, table2)
		checkTableSizes(table1, table2)
		local result = {}
		for i = 1, #table1 do
			result[i] = table1[i] - table2[i]
		end
		return result
	end,
}

-- Metatable for multiplication
local multiplication = {
	__mul = function(table1, table2)
		checkTableSizes(table1, table2)
		local result = {}
		for i = 1, #table1 do
			result[i] = table1[i] * table2[i]
		end
		return result
	end,
}

-- Metatable for division
local division = {
	__div = function(table1, table2)
		checkTableSizes(table1, table2)
		local result = {}
		for i = 1, #table1 do
			if table2[i] == 0 then
				print("Cannot divide by zero!")
				os.exit(1)
			end
			result[i] = table1[i] / table2[i]
		end
		return result
	end,
}

-- Function to print table output
local function printTable(tbl, message)
	if type(tbl) ~= "table" then
		print("Input is not of type 'table'")
		os.exit(1)
	end
	print(message or "Printing metatable")
	for _, value in pairs(tbl) do
		io.write(value, " ")
	end
	io.write("\n")
end

-- Create two tables
local tableA = { 1, 2, 10 }
local tableB = { 4, 5, 6 }

-- Perform custom addition
setmetatable(tableA, addition)
local additionResult = tableA + tableB
printTable(additionResult, "Addition result")

-- Perform custom subtraction
setmetatable(tableA, subtraction)
local subtractionResult = tableA - tableB
printTable(subtractionResult, "Subtraction result")

-- Perform custom multiplication
setmetatable(tableA, multiplication)
local multiplicationResult = tableA * tableB
printTable(multiplicationResult, "Multiplication result")

-- Perform custom division
setmetatable(tableB, division)
local divisionResult = tableA / tableB
printTable(divisionResult, "Division result")
