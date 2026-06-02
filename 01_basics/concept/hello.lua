#!/usr/bin/env lua
-- hello.lua — Your first Lua script: variables, types, and print.

local name = "Carlos"
local age = 30
local is_active = true
local nothing = nil

print("Hello, " .. name .. "!")
print("Age:", age)
print("Active:", is_active)
print("Nil:", nothing)

print("\nTypes:")
print(type(name))      --> string
print(type(age))       --> number
print(type(is_active)) --> boolean
print(type(nothing))   --> nil
print(type(print))     --> function
print(type({}))        --> table
