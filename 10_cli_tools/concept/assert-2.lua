#!/usr/bin/env lua
--
-- Attempt to open a file that doesn't exist
local file = assert(io.open("caca.lua", "r"), "Failed to open file")

print("File opened successfully'!")
local content = file:read("a")
io.write(content)
file:close()
