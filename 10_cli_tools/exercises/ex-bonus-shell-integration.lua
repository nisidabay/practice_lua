#!/usr/bin/env lua
-- Bonus Exercise: Shell integration with io.popen
--
-- Instructions: Use io.popen to run "ls" (or "dir" on Windows) and
-- capture the first few lines of directory listing.
--
-- NOTE: io.popen launches a subshell — be mindful of what commands you run.

-- TODO: Open a popen handle: io.popen("ls -1 | head -5") to list files
-- TODO: Read all output with handle:read("*a")
-- TODO: Close the handle
-- TODO: Print each line prefixed with "    "

-- Verification (DO NOT MODIFY)
print("Shell integration:")
-- Expected: First 5 files in the current directory
-- Solution: see exercises.lua
