#!/usr/bin/env lua
-- Exercise: __index default value via metatable
--
-- Instructions: Create a metatable with an __index function that returns
-- the number 0 for any key not found in the table. Then set up a table
-- with this metatable and test it.

-- TODO: Create a defaults metatable with __index = function(t, k) return 0 end
-- TODO: Create an empty table, assign a = 10
-- TODO: Set the metatable on the table
-- TODO: Print t.a, t.b, t.c

-- Verification (DO NOT MODIFY)
-- Expected: t.a = 10, t.b = 0, t.c = 0
-- Solution: see exercises.lua
