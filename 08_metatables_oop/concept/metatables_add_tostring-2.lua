#!/usr/bin/lua
--
-- Use of metamethods in tables with __add and __tostring

-- Define an empty table `t1`
local t1 = {}

-- Define a metatable `mt` with custom metamethods
local mt = {
	-- Custom addition metamethod
	__add = function(self, value)
		if type(value) ~= "number" then
			print("Invalid input. Please provide a number.")
			return
		end
		-- "self" refers to the table the metamethod is called on
		local result = {}
		-- Iterate over the elements of the table
		for i, v in ipairs(self) do
			-- Add the given value to each element
			result[i] = v + value
		end
		-- Set the metatable of the "result" to the same metatable as "self"
		setmetatable(result, getmetatable(self))
		-- Return the resulting table
		return result
	end,

	-- Custom tostring metamethod
	__tostring = function(self)
		-- "self" refers to the table the metamethod is called on
		local result = {}
		-- Iterate over the elements of the table
		for _, v in ipairs(self) do
			-- Convert each element to a string and insert into the result table
			table.insert(result, tostring(v))
		end
		-- Concatenate the result table elements into a single string separated by ", "
		return table.concat(result, ", ")
	end,
}

-- Assign values to the table `t1`
t1 = { 1, 2, 3 }
-- Set the metatable of `t1` to `mt`
setmetatable(t1, mt)

-- Print the original table
print("Original table:")
-- Use the custom tostring metamethod to print the table
print(tostring(t1))

-- Test the custom addition metamethod
local t3 = t1 + 5 -- Use a number for addition
-- Print the table after addition
print("\nTable after addition (+5):")
-- Use the custom tostring metamethod to print the resulting table
print(tostring(t3))

-- When `t1 + 5` is executed, the `__add` metamethod is called, which creates a
-- new table `t3` with the same metatable as `t1`. This means `t3` inherits the
-- `__tostring` metamethod from the metatable. Therefore, when `tostring(t3)` is
-- called, Lua uses the `__tostring` metamethod to convert `t3` to a string.
--
-- The `__tostring` metamethod iterates over the elements of `t3`, converts each
-- element to a string, and concatenates them into a single string separated by
-- ", ". This string is then returned and printed.
--
-- In summary, `t3` uses `tostring` because it has the same metatable as `t1`,
-- which includes the `__tostring` metamethod. This allows `t3` to be converted
-- to a string representation using the custom `__tostring` logic.
--
--
