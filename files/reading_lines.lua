#!/usr/bin/env lua
--
-- Read a file line by line
local file, err = io.open("myFile.txt", "r")
if file then
	for line in file:lines() do
		print(line)
	end
	file:close()
else
	print("Error opening file: " .. err)
end
