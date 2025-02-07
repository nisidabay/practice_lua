#!/usr/bin/lua

-- Create a table `t` to store key-value pairs
local t = {}

-- Define a metatable `mt` with a custom `__newindex` function
local mt = {
	-- Custom `__newindex` function to intercept assignments to `t`
	__newindex = function(tbl, key, value)
		-- Use `rawset` to actually set the key-value pair in the table
		rawset(tbl, key, value)
		-- Print the key-value pair being set
		print(key .. "=" .. value)
	end,
}

-- Set the metatable `mt` for table `t`
setmetatable(t, mt)

-- Assign values to keys in table `t`
t.somekey = "value" -- This triggers the `__newindex` function
t.otherkey = "other" -- This also triggers the `__newindex` function

-- Print the values associated with the keys
print(t.somekey) -- Output the value of `somekey`
print(t.otherkey) -- Output the value of `otherkey`
