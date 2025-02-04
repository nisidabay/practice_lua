#!/usr/bin/env lua
--
-- Implements dict-like behavior for tables

local myDict = {}
local metaTable = {
	__newindex = function(table, key, value)
		if type(key) == "string" then
			rawset(table, key, value)
			print("Added", key, "=", value)
		else
			error("Key must be a string")
		end
	end,
}
setmetatable(myDict, metaTable)

myDict["age"] = 30 -- Output: Added age = 30
