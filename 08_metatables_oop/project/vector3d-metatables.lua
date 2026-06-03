#!/usr/bin/env lua
local Vector3D = {}
local mt = {
    __add = function(a, b) return Vector3D.new(a.x+b.x, a.y+b.y, a.z+b.z) end,
    __sub = function(a, b) return Vector3D.new(a.x-b.x, a.y-b.y, a.z-b.z) end,
    __tostring = function(v) return string.format("(%.1f, %.1f, %.1f)", v.x, v.y, v.z) end,
}
mt.__index = Vector3D

function Vector3D.new(x, y, z)
    return setmetatable({x=x or 0, y=y or 0, z=z or 0}, mt)
end

function Vector3D:magnitude()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2)
end

function Vector3D:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z
end

local a = Vector3D.new(3, 4, 0)
local b = Vector3D.new(1, 2, 5)
print("a:", a, "|a|:", string.format("%.2f", a:magnitude()))
print("b:", b, "|b|:", string.format("%.2f", b:magnitude()))
print("a + b:", a + b)
print("a - b:", a - b)
print("a . b:", a:dot(b))
