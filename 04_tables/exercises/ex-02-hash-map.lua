#!/usr/bin/env lua
-- Exercise: Hash map — Fill in the person's fields and list keys
--
-- Create a person table with name, age, and city fields.
-- Then fill in the code to list all keys from the table.

-- TODO: fill in the person fields and key-listing loop
local person = {name = nil, age = nil, city = nil}
print(string.format("%s, %d, lives in %s", person.name, person.age, person.city))

-- List all keys from person (use pairs + table.sort)
local pkeys = {}
-- TODO: iterate over person keys and collect them
-- Hint: for key in pairs(person) do ... end
table.sort(pkeys)
print("Keys:", table.concat(pkeys, ", "))

-- Expected: Carlos, 30, lives in Valencia
-- Expected: Keys: age, city, name
-- Solution: see exercises.lua
