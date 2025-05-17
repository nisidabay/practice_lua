#!/usr/bin/env lua
--
-- temp files operations
local tempFile = io.tmpfile()

tempFile:write("Temporary data saved")
tempFile:seek("set", 0)

print("Reading from temporary file:")
print(tempFile:read("*a"))
tempFile:close()
