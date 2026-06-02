#!/usr/sbin/lua
--
-- Search the first occurrence of a string in a str, returning the start and end
-- indexes or nil
local str = "Hello world, goodby world"
local start_idx, end_idx = string.find(str, "world")
local formated_string = ""

if start_idx ~= nil or end_idx ~= nil then
	formated_string = string.format("String found at position %d:%d", start_idx, end_idx)
	print(formated_string)
else
	print("string not found")
end
