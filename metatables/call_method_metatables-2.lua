#!/usr/bin/lua

-- Create a table "mytable" and set its metatable to define custom behavior for
-- function call "()"
local mytable = { 10 }
local meta = {
	__call = function(_, newtable)
		local sum = 0

		-- Calculate the sum of elements in "mytable"
		for i = 1, #mytable do
			sum = sum + mytable[i]
		end

		-- Calculate the sum of elements in "newtable"
		for i = 1, #newtable do
			sum = sum + newtable[i]
		end

		return sum -- Return the sum of elements from both tables
	end,
}
setmetatable(mytable, meta)
-- Create a new table "newtable"
local newtable = { 10, 20, 30 }

-- Call the "mytable" as if it were a function and pass "newtable" as an
-- argument The custom __call metamethod is invoked to calculate and return the
-- sum of elements from both tables
print(mytable(newtable))
