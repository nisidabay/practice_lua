#!/usr/bin/env lua
-- exercises.lua -- Metatables & OOP. Run: lua exercises.lua

print("=== Ex 1: __index default value ===")
local defaults = {__index = function(t, k) return 0 end}
local t = setmetatable({}, defaults)
t.a = 10
print("t.a =", t.a, "| t.b =", t.b, "| t.c =", t.c)
print()

print("=== Ex 2: __add overloading ===")
local vec_mt = {}
vec_mt.__tostring = function(v) return string.format("Vector(%d, %d)", v.x, v.y) end
vec_mt.__add = function(a, b) return setmetatable({x = a.x + b.x, y = a.y + b.y}, vec_mt) end
local v1 = setmetatable({x = 3, y = 4}, vec_mt)
local v2 = setmetatable({x = 1, y = 2}, vec_mt)
local v3 = v1 + v2
print("v1:", tostring(v1))
print("v2:", tostring(v2))
print("v1 + v2:", tostring(v3))
print()

print("=== Ex 3: __tostring ===")
local person_mt = {
    __tostring = function(p) return string.format("%s, age %d", p.name, p.age) end,
}
local carlos = setmetatable({name = "Carlos", age = 30}, person_mt)
print(tostring(carlos))
print()

print("=== Ex 4: Simple class ===")
local Counter = {}
Counter.__index = Counter

function Counter.new(start)
    return setmetatable({value = start or 0}, Counter)
end

function Counter:inc()
    self.value = self.value + 1
    return self.value
end

function Counter:get()
    return self.value
end

local c = Counter.new()
c:inc(); c:inc(); c:inc()
print("Counter:", c:get())
print()

print("=== Ex 5: Inheritance ===")
local Animal = {}
Animal.__index = Animal

function Animal.new(name)
    return setmetatable({name = name}, Animal)
end

function Animal:speak()
    return self.name .. " makes a sound"
end

local Dog = setmetatable({}, Animal)
Dog.__index = Dog

function Dog.new(name)
    return setmetatable(Animal.new(name), Dog)
end

function Dog:speak()
    return self.name .. " barks!"
end

local rex = Dog.new("Rex")
print(rex:speak())
print()

print("=== BONUS: Protected table ===\n")
local protected = {}
local data = setmetatable({}, {
    __index = protected,
    __newindex = function(t, k, v)
        if k:match("^_") then
            print("Blocked write to private:", k)
        else
            rawset(t, k, v)
        end
    end,
})
data.name = "public"
data._secret = "private"
print("data.name =", data.name)
print("data._secret =", data._secret)
