#!/usr/bin/env lua
-- Round-robin task scheduler via coroutines

local function task(name, steps)
    return coroutine.create(function()
        for i = 1, steps do
            print(string.format("  [%s] step %d/%d", name, i, steps))
            coroutine.yield()
        end
    end)
end

local tasks = { task("download", 3), task("parse", 2), task("save", 1) }
local alive = true
while alive do
    alive = false
    for _, t in ipairs(tasks) do
        if coroutine.status(t) ~= "dead" then
            coroutine.resume(t)
            alive = true
        end
    end
end
print("All tasks done")
