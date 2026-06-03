#!/usr/bin/env lua
-- coroutine.wrap() reads lines from two files, interleaving them

local function read_lines(filename)
    local co = coroutine.create(function()
        local f = io.open(filename, "r") or error("cannot open " .. filename)
        for line in f:lines() do coroutine.yield(line) end
        f:close()
    end)
    return function()
        local _, val = coroutine.resume(co)
        return val
    end
end

-- Write two sample files
io.open("/tmp/a.txt", "w"):write("A1\nA2\nA3\n"):close()
io.open("/tmp/b.txt", "w"):write("B1\nB2\n"):close()

local a = read_lines("/tmp/a.txt")
local b = read_lines("/tmp/b.txt")
for i = 1, 5 do
    local line = a() or b()
    if not line then break end
    print(line)
end
os.remove("/tmp/a.txt"); os.remove("/tmp/b.txt")
