#!/usr/bin/lua
--
-- Use of the __call metamethod in Lua.
-- It creates a table 'mytable' with a custom behavior defined in its metatable.
-- When 'mytable' is called like a function, it calculates the sum of its own elements
-- and the elements of another table passed to it as an argument.

-- Create a table 'mytable' and set its metatable to define custom behavior
local mytable = setmetatable({ 10 }, {
	-- Define the __call metamethod
	__call = function(mytable, newtable)
		local sum = 0

		-- Calculate the sum of elements in 'mytable'
		for i = 1, #mytable do
			sum = sum + mytable[i]
		end

		-- Calculate the sum of elements in 'newtable'
		for i = 1, #newtable do
			sum = sum + newtable[i]
		end

		-- Return the sum of elements from both tables
		return sum
	end,
})

-- Create a new table 'newtable'
local newtable = { 10, 20, 30 }

-- Call 'mytable' as if it were a function and pass 'newtable' as an argument
-- The custom __call metamethod is invoked to calculate and return the sum of elements from both tables
print(mytable(newtable))
