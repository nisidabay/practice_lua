#!/usr/bin/env lua
-- varargs: ... captures any extra arguments into a table via {...}

local function average(...)
    local args = {...}
    local sum = 0
    for _, v in ipairs(args) do sum = sum + v end
    return sum / #args
end

print("avg(10,20,30):", average(10, 20, 30))       --> 20.0
print("avg(5,5,5,5):", average(5, 5, 5, 5))        --> 5.0

-- ... can be forwarded: wrap function calls another
local function log_and_call(fn, ...)
    print("calling with", #({...}), "args")
    return fn(...)
end
print("via wrapper:", log_and_call(average, 4, 6, 8)) --> 6.0
