#!/usr/bin/env lua
local name = "Carlos"
local bytes = {name:byte(1, -1)}     -- string.byte(s, 1, -1) -> all bytes
print("Bytes of '" .. name .. "':", table.concat(bytes, " "))

local decoded = string.char(table.unpack(bytes))  -- byte array -> string
print("Decoded:", decoded)
