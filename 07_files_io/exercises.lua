#!/usr/bin/env lua
-- exercises.lua -- Files & I/O practice. Run: lua exercises.lua

print("=== Ex 1: Write and read a file ===")
local fname = "/tmp/lua_practice_test.txt"
local f = io.open(fname, "w")
f:write("Line 1\nLine 2\nLine 3\n")
f:close()
print("Wrote:", fname)

local f = io.open(fname, "r")
local content = f:read("*a")
f:close()
print("Read back:\n" .. content)

os.remove(fname)
print()

print("=== Ex 2: Read line by line ===")
local f = io.open(fname, "w")
f:write("alpha\nbeta\ngamma\n")
f:close()

local lines = {}
for line in io.lines(fname) do
    lines[#lines + 1] = line:upper()
end
os.remove(fname)
print("Uppercased lines:", table.concat(lines, ", "))
print()

print("=== Ex 3: Append mode ===")
local f = io.open(fname, "a")
f:write("first\n")
f:close()
local f = io.open(fname, "a")
f:write("second\n")
f:close()
local f = io.open(fname, "r")
local full = f:read("*a")
f:close()
os.remove(fname)
print("After two appends:")
print(full)

print()

print("=== Ex 4: os functions ===")
print("Current time:", os.date("%Y-%m-%d %H:%M:%S"))
print("Working dir:", os.execute("pwd") ~= nil and "(ok)" or "unknown")
local success = os.execute("echo 'shell works' > /dev/null")
print("os.execute success:", success)
print()

print("=== Ex 5: io.popen ===")
local handle = io.popen("echo 'output from shell'")
local result = handle:read("*a")
handle:close()
print("popen result:", result:gsub("\n", ""))

print()

print("=== BONUS: File stats ===\n")
local f = io.open("/tmp/lua_bonus_test.txt", "w")
f:write("Hello World\n" .. string.rep("x", 100))
f:close()
local info = os.execute("stat -c '%s' /tmp/lua_bonus_test.txt 2>/dev/null || wc -c < /tmp/lua_bonus_test.txt")
local f = io.open("/tmp/lua_bonus_test.txt", "r")
local size = f:seek("end")
f:close()
os.remove("/tmp/lua_bonus_test.txt")
print(string.format("File size via seek: %d bytes", size))
