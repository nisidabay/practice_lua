#!/usr/bin/lua
--
-- Create a table with a metatable for custom indexing
local customTable = {}
local index = {
	__index = function(_, key)
		return "Key '" .. key .. "' not found!"
	end,
}
setmetatable(customTable, index)

-- Access a non-existent key
print(customTable.someKey)

customTable.otherKey = "Hello"
print(customTable.otherKey)
