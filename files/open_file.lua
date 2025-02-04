#!/usr/bin/env lua
--
-- Open file for reading
local file,err = io.open("myFile.txt", "r")

if file then
	local char = file:read("*a")
	print(char)
	file:close()
else
	print(err)
end
