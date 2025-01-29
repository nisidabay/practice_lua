#!/usr/bin/lua

--- Review of Lua Script
-- This script demonstrates basic variable types, operators, and string manipulation in Lua.
-- @module LuaScriptReview

-- Type of variables
local x = 10            -- Integer variable
local name = "Carlos"   -- String variable
local isAlive = false   -- Boolean variable
local a = nil           -- Nil value

-- Print the values of the variables
print(x)
print(name)
print(isAlive)
print(a)

-- Operators
local addition = x + 5     -- Addition operation
local minus = x - 3        -- Subtraction operation
local multiply = x * 2     -- Multiplication operation
local divide = x / 2       -- Division operation
local power = x ^ 3        -- Exponentiation operation
local modulus = x % 3      -- Modulus operation

-- Strings concatenation using '..'
local surname = " Lacaci Moya"
print(name .. surname)

-- Basic string functions
local upperName = string.upper(name)            -- Convert the name to uppercase
print(upperName)
local lowerName = string.lower(name)            -- Convert the name to lowercase
print(lowerName)
local replacedName = string.gsub(name, "Carlos", "Pepe")  -- Replace "pepe" in the name
print(replacedName)
local subName = string.sub(name, 1, 4)          -- Extract a substring from the name
print(subName)
local findC = string.find(surname, "c")         -- Find the position of 'c' in the surname
print(findC)
local strLength = string.len(name)                        -- Calculate the length of the name
print(strLength)

local multiLineString = [[
dfdfd
dfdfddfdfd
sdfd
dfdf
]]
print(multiLineString)
-- Note: In Lua, string indexes start at 1
