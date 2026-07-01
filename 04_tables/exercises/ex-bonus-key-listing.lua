#!/usr/bin/env lua
-- Exercise: Key listing helper — Fill in the keys function body
--
-- The keys(t) function should iterate over all keys in table t,
-- convert each to a string, collect them in a result list,
-- sort the list, and return it.

-- TODO: implement keys body
local function keys(t)
    -- Return a sorted list of all keys in t as strings
    return nil  -- placeholder
end

-- Verification (don't modify below):
local person = {name = "Carlos", age = 30, city = "Valencia"}
print("person keys:", table.concat(keys(person), ", "))
-- Expected: person keys: age, city, name
-- Solution: see exercises.lua
