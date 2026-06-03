#!/usr/bin/env lua
-- xpcall lets you add a custom error handler (stack trace, logging)

local function divide(a, b)
    if b == 0 then error("division by zero") end
    return a / b
end

local function handler(err)
    return "[" .. os.date("%H:%M:%S") .. "] ERROR: " .. err
end

local ok, result = xpcall(function() return divide(10, 0) end, handler)
print(ok and result or result)   -- prints handled error with timestamp

ok, result = xpcall(function() return divide(10, 2) end, handler)
print(result)                    -- 5.0 (handler only runs on error)
