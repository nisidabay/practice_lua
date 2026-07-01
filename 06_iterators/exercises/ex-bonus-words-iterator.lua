#!/usr/bin/env lua
-- Bonus Exercise: Words iterator
--
-- Instructions: Implement the `words(str)` function that returns an
-- iterator yielding each alphabetical word from the string in sequence.
-- Use string.find with the pattern "%a+" to locate words.

-- TODO: Implement the words() iterator
local function words(str)
  -- Return an iterator closure that yields each word from the string
  return nil
end

-- Verification (DO NOT MODIFY)
local w = {}
for word in words("the quick brown fox") do w[#w+1] = word end
print("words: " .. table.concat(w, ", "))
-- Solution: see exercises.lua
