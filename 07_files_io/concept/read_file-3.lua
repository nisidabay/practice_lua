#!/usr/bin/env lua
--
-- Open file for reading
local function readFile()
	io.write("Enter a file: ")
	local filename = io.read()
	local file = io.open(filename, "r")

	if file then
		local content = file:read("*a")
		print(content)
		file:close()
	else
		print(string.format("File not found [%s]", filename))
	end
end
readFile()
