#!/usr/bin/env lua

-- Set default file handle for I/O operations

-- Open file implicitly for reading
local inputFile, err = io.open("myFile.txt", "r")
if not inputFile then
	print("Error opening file for reading:", err)
else
	io.input(inputFile) -- Set implicit input descriptor
	local wholeFile = io.read("*a") -- implicitly reads from inputFile
	print("Content of the file: " .. (wholeFile or "[empty file]"))
	inputFile:close()
end

-- Open file implicitly for appending (writing)
local outputFile, err = io.open("myFile.txt", "a")
if not outputFile then
	print("Error opening file for appending:", err)
else
	io.output(outputFile) -- Set implicit output descriptor
	io.write("\nThis line was added implicitly via io.write().\n")
	outputFile:close()
	print("Line appended implicitly to file.")
end
