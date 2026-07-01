#!/usr/bin/env lua
-- Exercise: Closure counter — Fill in the make_counter function body
--
-- make_counter() should return a closure that increments and returns
-- an internal counter variable on each call. The counter starts at 0.

-- TODO: implement make_counter body
local function make_counter()
    -- Return a closure that increments and returns n
    return nil  -- placeholder
end

-- Verification (don't modify below):
local c = make_counter()
print("counter:", c(), c(), c())
-- Expected: counter: 1 2 3
-- Solution: see exercises.lua
