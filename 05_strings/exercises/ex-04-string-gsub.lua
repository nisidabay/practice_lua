#!/usr/bin/env lua
-- Exercise: string.gsub
--
-- Instructions: Use string.gsub (or :gsub) to:
--   1. Mask all digits in the phone number string with "X"
--   2. Wrap each word in "one two three" with brackets like [word]

local numbers = "call 555-1234 or 555-5678"
local words = "one two three"

-- TODO: Apply gsub patterns
local masked = nil
local bracketed = nil

-- Verification (DO NOT MODIFY)
print("masked: " .. tostring(masked))
print("bracketed: " .. tostring(bracketed))
-- Solution: see exercises.lua
