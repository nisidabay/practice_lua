#!/usr/bin/env lua
-- Exercise: Map function — Fill in the map function body
--
-- map(fn, tbl) should apply fn to each element of tbl (1-based array)
-- and return a new table with the results. Use ipairs to iterate.

-- TODO: implement map body
local function map(fn, tbl)
    -- Apply fn to each element and return a new table
    return nil  -- placeholder
end

-- Verification (don't modify below):
print("map(square, {1..5}):", table.concat(map(function(x) return x * x end, {1, 2, 3, 4, 5}), ", "))
print("map(halve, {10,20,30}):", table.concat(map(function(x) return x / 2 end, {10, 20, 30}), ", "))
-- Expected: map(square, {1..5}): 1, 4, 9, 16, 25
-- Expected: map(halve, {10,20,30}): 5, 10, 15
-- Solution: see exercises.lua
