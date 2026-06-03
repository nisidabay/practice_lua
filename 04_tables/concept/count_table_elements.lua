#!/usr/bin/env lua
-- ipairs stops at first nil; pairs sees all keys; #t is length operator

local colors = {"red", "green", nil, "blue", "yellow"}

-- ipairs: sequential, stops at nil
local c = 0; for _ in ipairs(colors) do c = c + 1 end
print("ipairs count:", c)   --> 2

-- pairs: every key, skips nothing
c = 0; for _ in pairs(colors) do c = c + 1 end
print("pairs  count:", c)   --> 4

-- # operator: array length (stops at nil too, counts last defined index)
print("#  count:", #colors)  --> 2 (# is undefined on tables with holes)
