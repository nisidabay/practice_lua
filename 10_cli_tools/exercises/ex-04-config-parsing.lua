#!/usr/bin/env lua
-- Exercise: Config file parsing with gmatch
--
-- Instructions: Parse a key=value config string using string.gmatch.
-- Each line has the format key=value (no spaces around =).

-- TODO: Use string.gmatch with the pattern "[^\\n]+" to iterate lines
-- TODO: For each line, use string.match with "^(%w+)%s*=%s*(.+)$"
-- TODO: Store key-value pairs in a config table
-- TODO: Print all config entries

-- Verification (DO NOT MODIFY)
print("Config parsing:")
-- Expected: host=localhost, port=5432, user=admin, debug=true
-- Solution: see exercises.lua
