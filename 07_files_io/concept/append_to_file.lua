#!/usr/bin/env lua
local f = io.open("/tmp/lua_append_demo.txt", "w")
f:write("original\n")
f:close()

f = io.open("/tmp/lua_append_demo.txt", "a")   -- "a" = append mode
f:write("appended line\n")
f:close()

for line in io.lines("/tmp/lua_append_demo.txt") do print(line) end
os.remove("/tmp/lua_append_demo.txt")
