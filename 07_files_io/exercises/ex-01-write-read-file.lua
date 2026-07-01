#!/usr/bin/env lua
-- Exercise: Write and read a file
--
-- Instructions: Open a temporary file for writing, write at least 3 lines
-- of text, close it, then open it again for reading and print the content.
-- Finally, remove the temp file with os.remove().
--
-- NOTE: All file operations use /tmp for temp files.

local fname = "/tmp/lua_ex01_write_read.txt"

-- TODO: Write 3 lines to the file using io.open with "w" mode
-- TODO: Read the content back using io.open with "r" mode and f:read("*a")

-- Verification (DO NOT MODIFY)
print("Wrote and read file:", fname)
-- Print the content after your read
-- Then clean up with os.remove(fname)
-- Solution: see exercises.lua
