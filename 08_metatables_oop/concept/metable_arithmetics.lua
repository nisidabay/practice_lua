#!/usr/bin/env lua
-- __add metatable: make tables add like vectors

local vec_mt = {
    __add = function(a, b)
        local r = {}
        for i = 1, math.max(#a, #b) do r[i] = (a[i] or 0) + (b[i] or 0) end
        return r
    end,
    __tostring = function(v) return "{" .. table.concat(v, ", ") .. "}" end,
}

local v1 = setmetatable({1, 2, 3}, vec_mt)
local v2 = setmetatable({4, 5, 6}, vec_mt)
print("v1:", tostring(v1))
print("v2:", tostring(v2))
print("v1+v2:", tostring(v1 + v2))
