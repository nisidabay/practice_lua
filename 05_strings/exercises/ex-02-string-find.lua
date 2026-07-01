#!/usr/bin/env lua
-- Exercise: string.find
--
-- Instructions: Use string.find (or the :find shorthand) to locate
-- the substring "quick" in the text and check if "zebra" appears.

-- TODO: Use string.find to locate "quick" and check for "zebra"
local text = "the quick brown fox"
local start, finish = nil
local has_zebra = nil

-- Verification (DO NOT MODIFY)
if start and finish then
  print(string.format("'quick' found at positions %d-%d", start, finish))
else
  print("'quick' not found")
end
print("'zebra' found? " .. tostring(has_zebra))
-- Solution: see exercises.lua
