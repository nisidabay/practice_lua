-- Create two tables
local tableA = { 1, 2, 3 }
local tableB = { 1, 2, 3 }

-- Define a metatable for custom equality
local customMetatable = {
	__eq = function(table1, table2)
		for i = 1, #table1 do
			if table1[i] ~= table2[i] then
				return false
			end
		end
		return true
	end,
}

-- Set the metatable for tableA
setmetatable(tableA, customMetatable)

-- Check for equality
if tableA == tableB then
	print("Tables are equal")
else
	print("Tables are not equal")
end
