#!/usr/bin/env lua
-- exercises.lua -- Basics practice. Run: lua exercises.lua

print("=== Ex 1: Variables and types ===")
local name = "Carlos"; local score = 95; local passed = true
print("Name:", name, "| type:", type(name))
print("Score:", score, "| type:", type(score))
print("Passed:", passed, "| type:", type(passed))
print()

print("=== Ex 2: Arithmetic ===")
local a, b = 15, 7
print(string.format("%d + %d = %d", a, b, a+b))
print(string.format("%d * %d = %d", a, b, a*b))
print(string.format("%d ^ %d = %d", a, b, a^b))
print()

print("=== Ex 3: String concat ===")
local first, second = "Hello", "World"
print(first .. ", " .. second .. "!")
print()

print("=== BONUS: Future age ===")
local n, c, a = "Carlos", "Valencia", 30
print(string.format("%s lives in %s, will be %d in 10 years", n, c, a+10))
