#!/usr/bin/lua
-- Create a table with a metatable for custom string representation
local customTable = { "a", "Carlos", 1 }
local metatable = {
	__tostring = function(table)
		local result = "{"
		for k, v in ipairs(table) do
			result = result .. k .. "=" .. v .. ", "
		end
		-- Substitute the last "," with "}"
		result = result:sub(1, -3) .. "}"
		return result
	end,
}
setmetatable(customTable, metatable)

-- Convert the table to a string
print(customTable)
