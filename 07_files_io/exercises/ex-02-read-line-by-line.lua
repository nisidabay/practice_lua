#!/usr/bin/env lua
-- Exercise: Read line by line
--
-- Instructions: Write some lines to a temp file, then use io.lines() to
-- read each line back. Collect the lines into a table, converting each
-- to uppercase with string.upper(). Print the result.
--
-- NOTE: All file operations use /tmp for temp files.

local fname = "/tmp/lua_ex02_lines.txt"

-- TODO: Write lines "alpha", "beta", "gamma" to the file
-- TODO: Use io.lines(fname) to read each line, convert to uppercase,
--       and collect into a table
-- TODO: Print the collected lines with table.concat

-- Verification (DO NOT MODIFY)
-- Expected output: "Uppercased lines: ALPHA, BETA, GAMMA"
-- Then clean up with os.remove(fname)
-- Solution: see exercises.lua
