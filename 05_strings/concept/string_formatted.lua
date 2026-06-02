#!/usr/sbin/lua
--
-- Return a formatted string
local name = "lua"
local version = "5.4"
local formatted_string = string.format("%s is %s", name, version)

print(formatted_string)
