#!/usr/bin/env lua
-- Exercise: Fibonacci iterator
--
-- Instructions: Implement the `fibonacci()` function that returns an
-- iterator yielding Fibonacci numbers (1, 1, 2, 3, 5, 8, 13, ...).
-- The loop below breaks when the value exceeds 50.

-- TODO: Implement the fibonacci() iterator
local function fibonacci()
  -- Return an iterator closure that yields Fibonacci numbers
  return nil
end

-- Verification (DO NOT MODIFY)
local fibs = {}
for n in fibonacci() do
  if n > 50 then break end
  fibs[#fibs+1] = n
end
print("Fibonacci < 50: " .. table.concat(fibs, ", "))
-- Solution: see exercises.lua
