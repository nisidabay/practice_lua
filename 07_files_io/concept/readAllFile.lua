#!/usr/bin/env lua
--
-- Read the whole file
local function readFile()
	io.write("Enter a file: ")
	local filename = io.read()
	local file = io.open(filename, "r")

	if not file then
		local error = string.format("File not found [%s]", filename)
		print(error)
	else
		local contents = file:read("a")
		print(contents)
		file:close()
	end
end
readFile()
