#!/usr/bin/env lua
-- Exercise: Multiple returns — Fill in the minmax function body
--
-- The function minmax(a, b) should return two values: the smaller and the larger.
-- Hint: use an if/else to decide which to return first.

-- TODO: implement minmax body
local function minmax(a, b)
    -- Return the smaller value first, then the larger value
    return nil  -- placeholder
end

-- Verification (don't modify below):
local lo, hi = minmax(42, 7)
print(string.format("minmax(42,7) -> lo=%d, hi=%d", lo, hi))
-- Expected: minmax(42,7) -> lo=7, hi=42
-- Solution: see exercises.lua
