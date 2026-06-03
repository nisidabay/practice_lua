#!/usr/bin/env lua
-- Class pattern: Person with constructor and methods via __index

local Person = {}
Person.__index = Person

function Person.new(name, age)
    return setmetatable({name = name, age = age}, Person)
end

function Person:introduce()
    return "Hi, I'm " .. self.name .. ", age " .. self.age
end

local p = Person.new("Carlos", 30)
print(p:introduce())
