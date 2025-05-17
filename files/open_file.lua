#!/usr/bin/env lua
--
-- Open file for reading
local file, err = io.open("myFile.txt", "r")

if file then
	print("File opened successfully for reding")
	file:close()
else
	print("Error opening file:", err)
end
