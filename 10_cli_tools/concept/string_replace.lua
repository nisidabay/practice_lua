#!/usr/bin/env lua
-- CLI sed-style replacement: lua string_replace.lua "hello world" world Lua

if #arg < 3 then
    print("Usage: lua string_replace.lua <string> <find> <replace>")
    os.exit(1)
end

local str, find, replace = arg[1], arg[2], arg[3]
local result, count = string.gsub(str, find, replace)
print(result)
print(string.format("(%d replacements)", count))
