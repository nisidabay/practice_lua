#!/usr/bin/env lua
--
-- Write to a file
local function writeToFile()
	io.write("Enter filename to save: ")
	local filename = io.read()

	io.write("Enter content to write: ")
	local contentToWrite = io.read("a") -- Read until EOF or Ctrl+D

	-- Open the file in write mode ("w")
	local file_handle = io.open(filename, "w")

	-- Check if the file was successfully opened
	if file_handle then
		-- Write some content to the file
		file_handle:write(contentToWrite)

		-- Close the file handle to save the content
		file_handle:close()
		print("Data has been saved to '" .. filename .. "'")
	else
		-- If file handle is nil, it means there was an error
		print("Error: Could not open the file for writing.")
	end
end
writeToFile()
