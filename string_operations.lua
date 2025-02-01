#!/usr/bin/lua
---
-- This script demonstrates basic variable types, operators, and string
-- manipulation in Lua.

-- String concatenation
local name ="Carlos"
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

local hello = "Hello, lua"
print("the lenght of the string is " .. #hello)
print("the lenght of the string is " .. string.len(hello))
-- Multi-line string
local multiLineString = [[
dfdfd
dfdfddfdfd
sdfd
dfdf
]]
print("Multi-line String:\n" .. multiLineString)

-- Pattern matching
local email = "john.doe@domain.com"
local username= string.match(email, "[^@]+")
print(username)

local text= "The quick brown fox spent $300 in chicken burger and $12.5 in coke"

local words={}
local numbers={}

for word in string.gmatch(text, "%a+") do
    table.insert(words, word)
end
for number in string.gmatch(text, "%d+") do
    table.insert(numbers, number)
end

for _,word in ipairs(words) do
    print(word)
end
for _,number in ipairs(numbers) do
    print(number)
end
