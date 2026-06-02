#!/usr/bin/env lua
--
-- Append to a specific file
local function appendToFile()
	io.write("Enter filename to append to: ")
	local filename = io.read()

	io.write("Enter content to append: ")
	local contentToAppend = io.read()

	local file, err = io.open(filename, "a")
	if file then
		file:write(contentToAppend .. "\n")
		file:close()
		print("Content appended to '" .. filename .. "'")
	else
		print("Error opening file: " .. err)
	end
end
appendToFile()
