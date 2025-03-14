#!/usr/bin/env lua
--
-- List directory contents
local lfs = require("lfs")

-- Function to list directory contents
local function list_directory_contents(directory)
	if not directory then
		print("Provide a directory path")
		return
	end

	local attr = lfs.attributes(directory)
	if not attr or attr.mode ~= "directory" then
		print("Invalid directory path")
		return
	end

	for file in lfs.dir(directory) do
		if file ~= "." and file ~= ".." then
			print(file)
		end
	end
end

-- Main execution
local dir = arg[1]
if dir == nil then
	print("Usage: dir_lister.lua <dir>")
else
	list_directory_contents(dir)
end
