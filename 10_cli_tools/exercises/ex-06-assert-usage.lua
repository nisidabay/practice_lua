#!/usr/bin/env lua
-- Exercise: assert usage
--
-- Instructions: Write a safe_sqrt() function that uses assert to validate
-- inputs before computing a square root.

-- TODO: Write safe_sqrt(n) function that:
--   - Asserts type(n) == "number", message: "expected number, got " .. type(n)
--   - Asserts n >= 0, message: "negative number: " .. n
--   - Returns math.sqrt(n)
-- TODO: Test with safe_sqrt(16)
-- TODO: Wrap safe_sqrt(-4) in pcall and print the error message

-- Verification (DO NOT MODIFY)
print("assert usage:")
-- Expected: sqrt(16) = 4, sqrt(-4) errors with "negative number: -4"
-- Solution: see exercises.lua
