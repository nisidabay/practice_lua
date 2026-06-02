#!/usr/sbin/lua
--
-- This script demonstrates the use of metatables in Lua to override the
-- behavior of the addition operator and the tostring function for tables.
--

-- Define a table with initial elements
local t = { "First string", "Second string" }

-- Define a metatable with custom behaviors
local mt = {
	-- Custom addition behavior
	__add = function(self, str)
		local _added = {}
		-- Concatenate each element of the table with the provided string
		for _, v in ipairs(self) do
			table.insert(_added, v .. str)
		end
		-- Set the metatable of the new table '_added' to the same metatable
		setmetatable(_added, getmetatable(self))
		return _added
	end,
	-- Custom tostring behavior
	__tostring = function(self)
		local _str = {}
		-- Convert each element of the table to a string
		for _, v in ipairs(self) do
			table.insert(_str, tostring(v))
		end
		-- Concatenate all elements into a single string separated by ", "
		return table.concat(_str, ", ")
	end,
}

-- Set the metatable for the table 't'
setmetatable(t, mt)

-- Define a string to be added to each element of the table
local t2 = " added with table (t2)"

-- Use the custom addition behavior defined in the metatable
local result = t + t2

-- Print the result using the custom tostring behavior
print(tostring(result))

-- Demonstrate the use of __tostring metamethod by printing the original table
print("original table:" .. tostring(t))
