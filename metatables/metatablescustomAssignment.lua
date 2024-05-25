#!/usr/bin/lua
-- Create a table with a metatable for custom assignment
local customTable = {}
local metatable = {
	__newindex = function(table, key, value)
		print("Setting key'" .. key .. "' to value '" .. value .. "'")
		rawset(table, key, value)
	end,
}
setmetatable(customTable, metatable)
-- Assign a value
customTable.somekey = 42

print("Table contents")
for k, v in pairs(customTable) do
	print(k .. ":" .. v)
end
