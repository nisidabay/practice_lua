#!/usr/bin/env lua
-- pcall catches errors so your program keeps running

local function divide(a, b)
    if b == 0 then error("division by zero") end
    return a / b
end

local ok, result = pcall(divide, 10, 2)
print("10/2:", ok and result or "failed")

ok, err = pcall(divide, 10, 0)
print("10/0:", ok and "ok" or err)

-- pcall returns: success (bool), then result or error message
