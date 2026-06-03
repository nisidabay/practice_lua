#!/usr/bin/env lua
-- exercises.lua — Iterators practice. Run: lua exercises.lua

print("=== Ex 1: pairs vs ipairs ===")
local t = {[2] = "two", [1] = "one", [3] = "three", name = "extra"}
local ikeys, akeys = {}, {}
for i in ipairs(t) do ikeys[#ikeys+1] = i end
for k in pairs(t) do akeys[#akeys+1] = tostring(k) end
table.sort(ikeys); table.sort(akeys)
print("ipairs keys:", table.concat(ikeys, ", "))
print("pairs keys:", table.concat(akeys, ", "))
print()

print("=== Ex 2: Stateless iterator ===")
local function range(start, stop)
    local i = start - 1
    return function()
        i = i + 1
        if i <= stop then return i end
    end
end
local vals = {}
for n in range(1, 5) do vals[#vals+1] = n end
print("range(1,5):", table.concat(vals, ", "))
print()

print("=== Ex 3: Stateful iterator (closure) ===")
local function take(n, source)
    local count = 0
    return function()
        count = count + 1
        if count <= n then return source[count] end
    end
end
local result = {}
for v in take(3, {"a", "b", "c", "d", "e"}) do result[#result+1] = v end
print("take(3, a..e):", table.concat(result, ", "))
print()

print("=== Ex 4: Fibonacci iterator ===")
local function fibonacci()
    local a, b = 0, 1
    return function()
        a, b = b, a + b
        return a
    end
end
local fibs = {}
for n in fibonacci() do
    if n > 50 then break end
    fibs[#fibs+1] = n
end
print("Fibonacci < 50:", table.concat(fibs, ", "))
print()

print("=== BONUS: Words iterator ===\n")
local function words(str)
    local pos = 1
    return function()
        local s, e = str:find("%a+", pos)
        if not s then return nil end
        pos = e + 1
        return str:sub(s, e)
    end
end
local w = {}
for word in words("the quick brown fox") do w[#w+1] = word end
print("words:", table.concat(w, ", "))
