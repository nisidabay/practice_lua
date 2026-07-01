#!/usr/bin/env lua
-- Exercise: Table as set — Track seen values in a table
--
-- Use a table as a set to track which values have been seen.
-- For each value in the list, set seen[value] = true.
-- Then collect the unique keys and print them sorted.

-- TODO: fill in the loop body to populate the seen table
local seen = {}
for _, v in ipairs({"a", "b", "a", "c", "b", "d"}) do
    -- Set seen[v] = true for each value
end

-- Collect unique keys (don't modify below):
local unique = {}
for k in pairs(seen) do unique[#unique + 1] = k end
table.sort(unique)
print("Unique:", table.concat(unique, ", "))

-- Expected: Unique: a, b, c, d
-- Solution: see exercises.lua
