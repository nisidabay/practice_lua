#!/usr/bin/env lua
-- Exercise: Stateless iterator (range function)
--
-- Instructions: Implement the `range(start, stop)` function so it returns
-- an iterator that yields integers from `start` to `stop` inclusive.

-- TODO: Implement the range() iterator
local function range(start, stop)
  -- Return an iterator function that yields values from start to stop
  return nil
end

-- Verification (DO NOT MODIFY)
local vals = {}
for n in range(1, 5) do vals[#vals+1] = n end
print("range(1,5): " .. table.concat(vals, ", "))
-- Solution: see exercises.lua
