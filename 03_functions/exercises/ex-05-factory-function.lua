#!/usr/bin/env lua
-- Exercise: Factory function — Fill in the make_multiplier function body
--
-- make_multiplier(factor) should return a function that takes x and returns
-- x * factor. This is a classic closure factory pattern.

-- TODO: implement make_multiplier body
local function make_multiplier(factor)
    -- Return a function that multiplies its argument by factor
    return nil  -- placeholder
end

-- Verification (don't modify below):
local triple = make_multiplier(3)
print("triple(7) =", triple(7))
-- Expected: triple(7) = 21
-- Solution: see exercises.lua
