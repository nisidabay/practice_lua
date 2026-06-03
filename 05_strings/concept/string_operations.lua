#!/usr/bin/env lua
local name, surname = "Carlos", "Lacaci Moya"
local full = name .. " " .. surname

print("upper:", string.upper(full))
print("lower:", string.lower(full))
print("gsub:", string.gsub(full, "Carlos", "Pepe"))
print("sub(1,6):", string.sub(full, 1, 6))
print("find('c'):", string.find(surname, "c"))        --> nil: case-sensitive
print("find('L'):", string.find(surname, "L"))         --> 1
print("#surname:", #surname)                           --> string length
