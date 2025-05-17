#!/usr/bin/env lua

local inputFile, fileErr = io.open("./myFile.txt", "a+")
if not inputFile then
	print("Error opening file:", fileErr)
	os.exit(1)
end

-- Write to the file
local line = "Hello Lua Programming"
inputFile:write(line .. "\n")

-- Move file pointer back to the start before reading
inputFile:seek("set", 0)

-- Read from the file
local wholefile, readErr = inputFile:read("*a")
if not wholefile then
	print("Error reading file:", readErr)
else
	print("File content after writing and seeking:")
	print(wholefile)
end

-- Close the file when done
inputFile:close()
