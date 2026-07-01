#!/usr/bin/env lua
-- Exercise: Stateful iterator (take function)
--
-- Instructions: Implement the `take(n, source)` function that returns an
-- iterator yielding the first `n` elements from the `source` array.

-- TODO: Implement the take() stateful iterator
local function take(n, source)
  -- Return an iterator closure that yields up to n elements from source
  return nil
end

-- Verification (DO NOT MODIFY)
local result = {}
for v in take(3, {"a", "b", "c", "d", "e"}) do result[#result+1] = v end
print("take(3, a..e): " .. table.concat(result, ", "))
-- Solution: see exercises.lua
