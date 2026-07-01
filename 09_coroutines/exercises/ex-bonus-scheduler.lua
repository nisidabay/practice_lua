#!/usr/bin/env lua
-- Bonus Exercise: Round-robin scheduler
--
-- Instructions: Implement a round-robin scheduler that runs multiple
-- coroutine tasks in a loop until all are finished.

-- TODO: Write a task(name, count) function that returns a function which:
--   - Loops i = 1, count
--   - Prints "[<name>] step <i>/<count>"
--   - Calls coroutine.yield()
-- TODO: Create 3 tasks with coroutine.create: A(2), B(3), C(1)
-- TODO: Implement the scheduler loop:
--   - Set alive = true
--   - While alive, loop through tasks
--   - If coroutine.status(t) ~= "dead", coroutine.resume(t) and set alive = true
--   - Otherwise alive = false when all dead

-- Verification (DO NOT MODIFY)
print("Round-robin scheduler:")
-- Expected: A/B/C tasks interleaved round-robin
-- Solution: see exercises.lua
