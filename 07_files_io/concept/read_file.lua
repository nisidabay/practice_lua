#!/usr/bin/env lua
local f = io.open("/tmp/lua_read_demo.txt", "w")
f:write("Line one\nLine two\nLine three\n")
f:close()

-- Read entire file
f = io.open("/tmp/lua_read_demo.txt", "r")
print(f:read("*a"))
f:close()

os.remove("/tmp/lua_read_demo.txt")
