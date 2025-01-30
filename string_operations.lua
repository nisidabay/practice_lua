#!/usr/bin/lua
--- 
-- This script demonstrates basic variable types, operators, and string manipulation in Lua.

-- Variable declarations
local x = 10            -- Integer variable
local name = "Carlos"   -- String variable
local isAlive = false   -- Boolean variable
local a = nil           -- Nil value

-- Print the values of the variables
print("Integer:", x)
print("Name:", name)
print("Is Alive:", isAlive)
print("Nil value:", a)

-- Arithmetic operations
local addition = x + 5
local subtraction = x - 3
local multiplication = x * 2
local division = x / 2
local exponentiation = x ^ 3
local modulus = x % 3

-- Print arithmetic results
print("Addition:", addition)
print("Subtraction:", subtraction)
print("Multiplication:", multiplication)
print("Division:", division)
print("Exponentiation:", exponentiation)
print("Modulus:", modulus)

-- String concatenation
local surname = " Lacaci Moya"
local fullName = name .. surname
print("Full Name:", fullName)

-- Basic string functions
local upperName = string.upper(name)
local lowerName = string.lower(name)
local replacedName = string.gsub(name, "Carlos", "Pepe")
local subName = string.sub(name, 1, 4)
local findC = string.find(surname, "c")
local strLength = string.len(name)

-- Print string function results
print("Uppercase Name:", upperName)
print("Lowercase Name:", lowerName)
print("Replaced Name:", replacedName)
print("Substring of Name:", subName)
print("Position of 'c' in Surname:", findC)
print("Length of Name:", strLength)

-- Multi-line string
local multiLineString = [[
dfdfd
dfdfddfdfd
sdfd
dfdf
]]
print("Multi-line String:\n" .. multiLineString)

-- Note: In Lua, string indexes start at 1
