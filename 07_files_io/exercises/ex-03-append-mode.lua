#!/usr/bin/env lua
-- Exercise: Append mode
--
-- Instructions: Open a temp file in append ("a") mode twice, writing one
-- line each time. Then open it for reading to verify both lines are present.
--
-- NOTE: All file operations use /tmp for temp files.

local fname = "/tmp/lua_ex03_append.txt"

-- TODO: Open file with "a" mode, write "first", close
-- TODO: Open file with "a" mode again, write "second", close
-- TODO: Open with "r" mode, read all content ("*a"), print it

-- Verification (DO NOT MODIFY)
-- Expected output: both "first" and "second" lines present
-- Then clean up with os.remove(fname)
-- Solution: see exercises.lua
