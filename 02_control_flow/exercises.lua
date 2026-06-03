#!/usr/bin/env lua
-- exercises.lua -- Control flow practice. Run: lua exercises.lua

print("=== Ex 1: if/else grade ===")
local score = 85
if score >= 90 then
    print("A")
elseif score >= 80 then
    print("B")
elseif score >= 70 then
    print("C")
else
    print("F")
end
print()

print("=== Ex 2: For loop ===")
for i = 1, 5 do
    print(string.format("Iteration %d", i))
end
print()

print("=== Ex 3: While countdown ===")
local n = 5
while n > 0 do
    print(n)
    n = n - 1
end
print("Go!")
print()

print("=== Ex 4: Nested loops ===")
for row = 1, 3 do
    for col = 1, 3 do
        io.write(string.format("(%d,%d) ", row, col))
    end
    print()
end
print()

print("=== BONUS: FizzBuzz ===\n")
for i = 1, 20 do
    if i % 15 == 0 then
        print(i .. ": FizzBuzz")
    elseif i % 3 == 0 then
        print(i .. ": Fizz")
    elseif i % 5 == 0 then
        print(i .. ": Buzz")
    else
        print(i)
    end
end
