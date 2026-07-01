#!/usr/bin/env lua
-- Exercise: string.gmatch
--
-- Instructions: Use string.gmatch (or :gmatch) with the pattern "%a+"
-- to iterate over all words in the text and collect them into the `words` table.

local text = "the quick brown fox"

-- TODO: Use gmatch to extract words into the table
local words = {}

-- Verification (DO NOT MODIFY)
if #words > 0 then
  print("Words in text: " .. table.concat(words, " | "))
else
  print("Words: (empty)")
end
-- Solution: see exercises.lua
