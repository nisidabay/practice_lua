#!/usr/bin/env lua
-- pcall + assert: catch errors with a message

local function divide(a, b)
    assert(type(a) == "number" and type(b) == "number", "both args must be numbers")
    assert(b ~= 0, "division by zero")
    return a / b
end

local ok, result = pcall(divide, 10, 2)
print("10/2:", ok and result or result)

ok, result = pcall(divide, 10, 0)
print("10/0:", result)                    -- "division by zero"

ok, result = pcall(divide, "x", 2)
print("'x'/2:", result)                   -- "both args must be numbers"
