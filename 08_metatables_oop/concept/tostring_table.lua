#!/usr/bin/lua

-- Create a table "mytable" with values 10, 20, and 30
local mytable = setmetatable({ 10, 20, 30 }, {
	-- Define a custom __tostring metamethod
	__tostring = function(mytable)
		local sum = 0

		-- Calculate the sum of values in "mytable"
		for _, v in pairs(mytable) do
			sum = sum + v
		end

		-- Return a custom string representation
		return "The sum of values in table is: " .. sum
	end,
})

-- When you print "mytable," the __tostring metamethod is invoked
-- It calculates the sum and returns a custom string representation
print(mytable)
