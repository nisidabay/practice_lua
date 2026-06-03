#!/usr/bin/env lua
local f = io.open("/tmp/lua_readall_demo.txt", "w")
f:write("One\nTwo\nThree\n")
f:close()

-- read("*a") = read all content as one string
f = io.open("/tmp/lua_readall_demo.txt", "r")
local all = f:read("*a")
f:close()
print(all)

-- Without explicit open: whole-file read in one statement
local lines = {}
for line in io.lines("/tmp/lua_readall_demo.txt") do
    lines[#lines + 1] = line
end
print("Via io.lines:", table.concat(lines, " | "))

os.remove("/tmp/lua_readall_demo.txt")
