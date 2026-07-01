#!/usr/bin/env lua
-- Bonus Exercise: File stats via seek
--
-- Instructions: Write a test file containing "Hello World\\n" plus 100
-- repeated 'x' characters. Then use f:seek("end") to determine the file
-- size in bytes without reading its content.
--
-- NOTE: All file operations use /tmp for temp files.

local fname = "/tmp/lua_bonus_file_stats.txt"

-- TODO: Write test content to the file
-- TODO: Open for reading and use f:seek("end") to get file size
-- TODO: Print the size, then remove the file

-- Verification (DO NOT MODIFY)
-- Expected: "File size via seek: <N> bytes"
-- Then clean up with os.remove(fname)
-- Solution: see exercises.lua
