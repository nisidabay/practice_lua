#!/usr/bin/env lua
-- Exercise: pcall error handling
--
-- Instructions: Implement a divide() function that errors on zero divisor,
-- then use pcall to safely call it with valid and invalid inputs.

-- TODO: Write a divide(a, b) function that errors if b == 0:
--   error("division by zero")
--   Otherwise returns a / b
-- TODO: Use pcall to call divide(10, 2) — print ok and result
-- TODO: Use pcall to call divide(10, 0) — print ok and error message

-- Verification (DO NOT MODIFY)
print("pcall handling:")
-- Expected: 10/2 = 5, 10/0 errors with "division by zero"
-- Solution: see exercises.lua
