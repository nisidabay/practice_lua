#!/usr/bin/lua
-- Define a table
local myTable = { name = "John", age = 30 }

-- Create a metatable for the table
local metatable = {
	__index = function(table, key)
		return "Key '" .. key .. "' not found!"
	end,
	__tostring = function(table)
		return "This is a custom table with name: " .. table.name
	end,
}

-- Set the metatable for the table
setmetatable(myTable, metatable)

-- Use getmetatable() to retrieve the metatable
local retrievedMetatable = getmetatable(myTable)

-- Check if the metatable is the same as the one we created
if retrievedMetatable == metatable then
	print("Metatable retrieved successfully!")
else
	print("Metatable retrieval failed!")
end

-- Access the table using custom behavior defined in the metatable
print(myTable.name) -- Output: John
print(myTable.city) -- Output: Key 'city' not found!

-- Use custom __tostring behavior defined in the metatable
print(tostring(myTable)) -- Output: This is a custom table with name: John
print(getmetatable(myTable))
