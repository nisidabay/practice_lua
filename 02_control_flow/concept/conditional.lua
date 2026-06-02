#!/usr/bin/env lua
--
-- Simulate the ternary operator in C
local age = 15
local legal_age = 16
local message = (age >= legal_age) and "You can vote and drnk" or "You cannot neither vote nor drink"
print(message)
