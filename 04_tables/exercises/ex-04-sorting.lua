#!/usr/bin/env lua
-- Exercise: Sorting — Sort numbers ascending then descending
--
-- Complete table.sort with a custom comparator to sort numbers
-- in descending order (largest to smallest).
-- The ascending sort is already done for you.

-- ✏️ Complete the descending sort below:
local nums = {5, 2, 9, 1, 5, 6}

-- Sort ascending (default behavior)
table.sort(nums)
print("Sorted nums:", table.concat(nums, ", "))

-- TODO: Replace the line below with a descending sort:
-- table.sort(nums, )
print("Descending:", table.concat(nums, ", "))

-- Expected: Sorted nums: 1, 2, 5, 5, 6, 9
-- Expected: Descending: 9, 6, 5, 5, 2, 1
-- Solution: see exercises.lua
