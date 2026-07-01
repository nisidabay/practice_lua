#!/usr/bin/env lua
-- Exercise: Anonymous function — Fill in the doubling expression
--
-- Use an anonymous function (function(x) ... end) called immediately
-- to double each value in the nums table and store it in doubled.

-- TODO: fill in the anonymous function body
local nums = {1, 2, 3, 4, 5}
local doubled = {}
for i, v in ipairs(nums) do
    doubled[i] = (function(x) return nil end)(v)
end

-- Verification (don't modify below):
print("doubled:", table.concat(doubled, ", "))
-- Expected: doubled: 2, 4, 6, 8, 10
-- Solution: see exercises.lua
