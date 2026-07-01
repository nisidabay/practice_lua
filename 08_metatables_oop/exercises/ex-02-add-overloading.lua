#!/usr/bin/env lua
-- Exercise: __add metamethod overloading
--
-- Instructions: Create a metatable with __add that adds two vectors
-- (tables with x and y fields) component-wise. Also add a __tostring
-- for readable output.

-- TODO: Create a vec_mt metatable with __add and __tostring metamethods
-- TODO: Create v1 = {x = 3, y = 4} and v2 = {x = 1, y = 2} with metatable
-- TODO: Compute v3 = v1 + v2 and print all three vectors

-- Verification (DO NOT MODIFY)
-- Expected: v1: Vector(3, 4), v2: Vector(1, 2), v1 + v2: Vector(4, 6)
-- Solution: see exercises.lua
