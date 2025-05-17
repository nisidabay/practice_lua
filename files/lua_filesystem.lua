#!/usr/bin/env lua
--
-- filesystem operations
local lfs = require("lfs")
local filepath = "myFile.txt"
local attr, err = lfs.attributes(filepath)

if attr then
	print("File attributes:")
	print("Size: ", attr.size, "bytes")
	print("Last modified:", os.date("%Y-%m-%d %H:%M:%S", attr.modification))
else
	print("Failed to get atttributes:", err)
end
