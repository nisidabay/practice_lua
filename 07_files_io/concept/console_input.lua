#!/usr/bin/env lua
-- io.read() reads from stdin. This demo uses sample data.

-- Simulate user input by writing to a temp file, then reading
local f = io.open("/tmp/lua_stdin.txt", "w")
f:write("Carlos\n")
f:close()

-- Redirect: this demo just shows the pattern
print("Without redirection, this would wait for keyboard:")
print("  name = io.read()")
print("  print('Hello ' .. name)")
print()

-- Actually read from the temp file to demonstrate
local f = io.open("/tmp/lua_stdin.txt", "r")
local name = f:read("*l")
f:close()
print("Hello " .. name)

os.remove("/tmp/lua_stdin.txt")
