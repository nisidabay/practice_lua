#!/usr/bin/env lua
--
-- Write to a file
local file, err = io.open("myFile.txt", "a")
if file then
	file:write("This is from write_file.lua")
	file:close()
else
	print("Error opening file: " .. err)
end
