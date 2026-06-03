#!/usr/bin/env lua
local f = io.open("/tmp/lua_write_demo.txt", "w")   -- "w" = write (overwrites)
f:write("Hello from Lua!\n")
f:write("Line 2\n")
f:close()

for line in io.lines("/tmp/lua_write_demo.txt") do print(line) end
os.remove("/tmp/lua_write_demo.txt")
