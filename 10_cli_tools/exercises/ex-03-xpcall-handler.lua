#!/usr/bin/env lua
-- Exercise: xpcall with error handler
--
-- Instructions: Use xpcall with a custom error handler that prepends a
-- timestamp to the error message.

-- TODO: Write a handler(err) function that returns:
--   "[" .. os.date("%H:%M:%S") .. "] " .. err
-- TODO: Write a risky() function that calls error("file not found: data.txt")
-- TODO: Call xpcall(risky, handler) and print the captured error

-- Verification (DO NOT MODIFY)
print("xpcall handling:")
-- Expected: [HH:MM:SS] file not found: data.txt
-- Solution: see exercises.lua
