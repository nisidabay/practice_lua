#!/usr/bin/lua
-- Create a table with a metatable for custom indexing
local customTable = {}
local metatable = {
	__index = function(_, key)
		return "Key '" .. key .. "' not found!"
	end,
}
setmetatable(customTable, metatable)

-- Access a non-existent key
print(customTable.someKey)

customTable.otherKey = "Hello"
print(customTable.otherKey)
