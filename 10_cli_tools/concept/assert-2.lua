#!/usr/bin/env lua
-- assert triggers error on false; pcall catches it

local ok, err = pcall(function()
    assert(io.open("nonexistent_file.lua"), "Failed to open file")
end)
print("pcatch caught:", err)

-- assert works: open a file that does exist
local f = io.open("/tmp/lua_assert_test.txt", "w")
f:write("hello")
f:close()

f = assert(io.open("/tmp/lua_assert_test.txt", "r"), "Failed to open file")
print("File opened:", f:read("*a"))
f:close()
os.remove("/tmp/lua_assert_test.txt")
