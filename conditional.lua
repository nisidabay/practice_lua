#!/usr/bin/env lua
--
-- Conditional Example
-- Simulate the ternary operator in C
local age = 15
local legal_age = 16
local message = (age >= legal_age) and "You can vote and drink" or "You cannot neither vote nor drink"
print(message)
