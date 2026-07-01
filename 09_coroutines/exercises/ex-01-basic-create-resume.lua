#!/usr/bin/env lua
-- Exercise: Basic coroutine.create and coroutine.resume
--
-- Instructions: Create a coroutine that prints "step 1", yields,
-- prints "step 2", yields, and prints "step 3". Then resume it
-- three times outside the coroutine.
--
-- NOTE: The coroutine.resume calls should remain OUTSIDE the coroutine
-- function body.

-- TODO: Create a coroutine with coroutine.create() that:
--   - Prints "step 1"
--   - Calls coroutine.yield()
--   - Prints "step 2"
--   - Calls coroutine.yield()
--   - Prints "step 3"
-- TODO: Resume the coroutine three times

-- Verification (DO NOT MODIFY)
print("Basic coroutine:")
-- Expected output: step 1, step 2, step 3
-- Solution: see exercises.lua
