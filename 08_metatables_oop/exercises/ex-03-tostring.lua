#!/usr/bin/env lua
-- Exercise: __tostring metamethod
--
-- Instructions: Create a metatable with __tostring that formats a person
-- table as "Name, age N". Then create a person table with the metatable.

-- TODO: Create a person_mt metatable with __tostring
--       Format: string.format("%s, age %d", p.name, p.age)
-- TODO: Create a person table {name = "Carlos", age = 30} with the metatable
-- TODO: Print tostring(person)

-- Verification (DO NOT MODIFY)
-- Expected: "Carlos, age 30"
-- Solution: see exercises.lua
