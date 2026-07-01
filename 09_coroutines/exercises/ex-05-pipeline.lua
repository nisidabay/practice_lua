#!/usr/bin/env lua
-- Exercise: Pipeline coroutines
--
-- Instructions: Write a doubler coroutine that receives values via
-- coroutine.yield() (used as a receive point) and prints the doubled result.

-- TODO: Create a doubler() function that loops forever:
--   - Uses local n = coroutine.yield() to receive values
--   - Prints "doubled: <n> -> <n*2>"
-- TODO: Create the coroutine with coroutine.create(doubler)
-- TODO: Prime the coroutine with coroutine.resume(d)
-- TODO: Resume with values 5, 10, 15

-- Verification (DO NOT MODIFY)
print("Pipeline:")
-- Expected: doubled: 5 -> 10, doubled: 10 -> 20, doubled: 15 -> 30
-- Solution: see exercises.lua
