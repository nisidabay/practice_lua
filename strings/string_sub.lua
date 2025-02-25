#!/usr/sbin/lua
--
-- Returns the substring of str from start to end. If start is omitted it
-- defaults to the entire string
local str = "Hello world, goodbye world"
local new_str = string.sub(str, 7, 11)
-- local new_str = string.sub(str,7)

if new_str then
	print(new_str)
else
	print("No string found")
end
