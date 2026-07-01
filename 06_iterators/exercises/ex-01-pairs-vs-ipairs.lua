#!/usr/bin/env lua
-- Exercise: pairs vs ipairs
--
-- Instructions: Fill in the two loops below to collect keys from the
-- mixed table. Use ipairs for sequential integer keys and pairs for all keys.

local t = {[2] = "two", [1] = "one", [3] = "three", name = "extra"}

-- TODO: Use ipairs to iterate over sequential keys
local ikeys = {}
-- Your ipairs loop here:

-- TODO: Use pairs to iterate over all keys
local akeys = {}
-- Your pairs loop here:

-- Verification (DO NOT MODIFY)
table.sort(ikeys)
table.sort(akeys)
print("ipairs keys: " .. table.concat(ikeys, ", "))
print("pairs keys: " .. table.concat(akeys, ", "))
-- Solution: see exercises.lua
