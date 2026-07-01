#!/usr/bin/env lua
-- repeat / until — loop at least once, check after
--
-- Unlike while, repeat/until guarantees the body runs at least once
-- because the condition is checked AFTER each iteration.

print("=== repeat/until basics ===")

local i = 1
repeat
    print("repeat iteration:", i)
    i = i + 1
until i > 3

print()

print("=== repeat/until with sentinel ===")
-- Common pattern: read input until a valid value
local function find_divisor(n, max)
    local d = 2
    repeat
        if n % d == 0 then return d end
        d = d + 1
    until d > max
    return nil
end

print("Smallest divisor of 15:", find_divisor(15, 10))
print("Smallest divisor of 7:", find_divisor(7, 10))
print("No divisor under 10 for 11:", find_divisor(11, 10))

print()

print("=== while vs repeat ===")
-- while: condition checked BEFORE, may never run
local x = 10
while x < 5 do
    print("while ran (unexpected)")
end
print("while: did NOT run (x=10 is not < 5)")

-- repeat: condition checked AFTER, always runs at least once
local y = 10
repeat
    print("repeat ran once even though y=10 is not < 5")
until y < 5
