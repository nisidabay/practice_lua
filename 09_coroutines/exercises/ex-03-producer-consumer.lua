#!/usr/bin/env lua
-- Exercise: Producer-consumer with coroutines
--
-- Instructions: Write a receive() function that takes a producer coroutine
-- and repeatedly resumes it until dead, collecting yielded values into a table.

-- TODO: Write a receive(prod) function that:
--   - Creates an empty results table
--   - Loops while coroutine.status(prod) ~= "dead"
--   - Calls coroutine.resume(prod) and collects ok, val
--   - Appends val to results if ok and val is truthy
--   - Returns the results table
-- TODO: Create a producer coroutine that yields "apple", "banana", "cherry"
-- TODO: Call receive() and print the items with table.concat()

-- Verification (DO NOT MODIFY)
print("Producer-consumer:")
-- Expected: apple, banana, cherry
-- Solution: see exercises.lua
