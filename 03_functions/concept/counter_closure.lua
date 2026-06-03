#!/usr/bin/env lua
local function makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

local c = makeCounter()
print(c(), c(), c())   --> 1   2   3

-- Each call to makeCounter creates a fresh closure with its own count
local d = makeCounter()
print("new counter:", d(), d())   --> 1   2
