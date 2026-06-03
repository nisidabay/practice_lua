#!/usr/bin/env lua
local name = "Carlos"       -- local: only visible in this file
city = "Valencia"           -- global: visible everywhere

print(name, "lives in", city)

-- Locals don't pollute _G
print("_G.name:", _G.name or "nil")
print("_G.city:", _G.city)
