#!/usr/bin/env lua
-- Exercise: Command-line argument parsing with arg table
--
-- Instructions: Iterate over the global `arg` table to print script name,
-- the number of arguments, and each argument's index and value.
--
-- NOTE: The arg table is populated at runtime by the Lua interpreter.
-- When run as `lua ex-01-arg-parsing.lua`, arg[0] is the script name
-- and arg[1..n] are the positional arguments.
-- For standalone testing without CLI args, uncomment the fallback below:
-- arg = {"hello", "world", "test"}

-- TODO: Print string.format("Script: %s | #args: %d", arg[0] or "unknown", #arg)
-- TODO: If #arg > 0, loop through ipairs(arg) and print "arg[<i>] = <a>"

-- Verification (DO NOT MODIFY)
print("Arg parsing:")
-- Expected: Script: ... | #args: 0 (when run without args)
-- Solution: see exercises.lua
