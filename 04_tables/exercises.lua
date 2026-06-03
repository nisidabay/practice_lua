#!/usr/bin/env lua
-- exercises.lua -- Tables practice. Run: lua exercises.lua

print("=== Ex 1: Array indexing (1-based!) ===")
local fruits = {"apple", "banana", "cherry"}
print("fruits[1] =", fruits[1])
print("fruits[2] =", fruits[2])
print("#fruits =", #fruits)
print()

print("=== Ex 2: Hash map ===")
local person = {name = "Carlos", age = 30, city = "Valencia"}
print(string.format("%s, %d, lives in %s", person.name, person.age, person.city))
local pkeys = {}; for key in pairs(person) do pkeys[#pkeys+1] = key end; table.sort(pkeys)
print("Keys:", table.concat(pkeys, ", "))
print()

print("=== Ex 3: Insert and remove ===")
table.insert(fruits, "date")
table.insert(fruits, 2, "blueberry")
print("After insert:", table.concat(fruits, ", "))
table.remove(fruits, 2)
print("After remove pos 2:", table.concat(fruits, ", "))
print()

print("=== Ex 4: Sorting ===")
local nums = {5, 2, 9, 1, 5, 6}
table.sort(nums)
print("Sorted nums:", table.concat(nums, ", "))
table.sort(nums, function(a, b) return a > b end)
print("Descending:", table.concat(nums, ", "))
print()

print("=== Ex 5: Nested tables ===")
local matrix = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
}
print("matrix[2][3] =", matrix[2][3])
print("diagonal:", matrix[1][1], matrix[2][2], matrix[3][3])
print()

print("=== Ex 6: Table as set ===")
local seen = {}
for _, v in ipairs({"a", "b", "a", "c", "b", "d"}) do
    seen[v] = true
end
local unique = {}
for k in pairs(seen) do unique[#unique + 1] = k end
table.sort(unique)
print("Unique:", table.concat(unique, ", "))
print()

print("=== BONUS: Key listing helper ===\n")
local function keys(t)
    local result = {}
    for k in pairs(t) do result[#result + 1] = tostring(k) end
    table.sort(result)
    return result
end
print("person keys:", table.concat(keys(person), ", "))
