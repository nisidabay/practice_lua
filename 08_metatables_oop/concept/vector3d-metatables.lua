#!/usr/bin/env lua
local Vector3D = {}
local mt = {
    __add = function(a, b) return Vector3D.new(a.x + b.x, a.y + b.y, a.z + b.z) end,
    __tostring = function(v) return string.format("Vector3D(%.1f, %.1f, %.1f)", v.x, v.y, v.z) end,
}
mt.__index = Vector3D

function Vector3D.new(x, y, z)
    return setmetatable({x = x or 0, y = y or 0, z = z or 0}, mt)
end

function Vector3D:magnitude()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2)
end

local v1 = Vector3D.new(3, 4, 0)
local v2 = Vector3D.new(1, 2, 5)
print(v1, "+", v2, "=", v1 + v2)
print("|v1| =", v1:magnitude())
