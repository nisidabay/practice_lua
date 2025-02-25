#!/usr/sbin/lua
--
-- Look for the first match of a string returning the string found or nil
local str = "Hello world, goodbye world"

local match = string.match(str, "world")
if match then
	print(match)
else
	print("No match found")
end
