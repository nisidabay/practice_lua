#!/usr/bin/env lua

-- Define a table with initial data
local personTable = { name = "John", age = 30, city = "Spain" }

-- Create a metatable with custom behaviors
local customMetatable = {
	-- Custom __index function to handle missing keys
	__index = function(_, key)
		return "Key '" .. key .. "' not found!"
	end,
	-- Custom __tostring function to provide a string representation
	__tostring = function(tbl)
		local result = {}
		for _, key in ipairs({ "name", "age", "city" }) do
			table.insert(result, key .. ": " .. tostring(tbl[key]))
		end
		return table.concat(result, ", ")
	end,
}

-- Set the custom metatable for the personTable
setmetatable(personTable, customMetatable)

-- Retrieve the metatable using getmetatable()
local retrievedMetatable = getmetatable(personTable)

-- Verify if the retrieved metatable matches the custom one
if retrievedMetatable == customMetatable then
	print("Metatable retrieved successfully!")
else
	print("Metatable retrieval failed!")
end

-- Access the table using custom behavior defined in the metatable
print(personTable.name) -- Output: John
print(personTable.age) -- Output: 30
print(personTable.city) -- Output: Spain
print(tostring(personTable)) -- Output: name: John, age: 30, city: Spain

