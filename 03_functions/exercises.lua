#!/usr/bin/env lua
-- exercises.lua — Functions practice. Run: lua exercises.lua

print("=== Ex 1: Multiple returns ===")
local function minmax(a, b)
    if a < b then return a, b else return b, a end
end
local lo, hi = minmax(42, 7)
print(string.format("minmax(42,7) -> lo=%d, hi=%d", lo, hi))
print()

print("=== Ex 2: Varargs sum ===")
local function sum(...)
    local total = 0
    for _, v in ipairs({...}) do total = total + v end
    return total
end
print("sum(1,2,3,4,5) =", sum(1, 2, 3, 4, 5))
print()

print("=== Ex 3: Recursive factorial ===")
local function fact(n)
    if n <= 1 then return 1 end
    return n * fact(n - 1)
end
print("5! =", fact(5))
print()

print("=== Ex 4: Closure counter ===")
local function make_counter()
    local n = 0
    return function() n = n + 1; return n end
end
local c = make_counter()
print("counter:", c(), c(), c())
print()

print("=== Ex 5: Factory function ===")
local function make_multiplier(factor)
    return function(x) return x * factor end
end
local triple = make_multiplier(3)
print("triple(7) =", triple(7))
print()

print("=== Ex 6: Anonymous function ===")
local nums = {1, 2, 3, 4, 5}
local doubled = {}
for i, v in ipairs(nums) do
    doubled[i] = (function(x) return x * 2 end)(v)
end
print("doubled:", table.concat(doubled, ", "))
print()

print("=== BONUS: map function ===\n")
local function map(fn, tbl)
    local result = {}
    for i, v in ipairs(tbl) do result[i] = fn(v) end
    return result
end
print("map(square, {1..5}):", table.concat(map(function(x) return x * x end, {1, 2, 3, 4, 5}), ", "))
print("map(halve, {10,20,30}):", table.concat(map(function(x) return x / 2 end, {10, 20, 30}), ", "))
