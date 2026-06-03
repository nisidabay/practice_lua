#!/usr/bin/env lua
local function producer()
    return coroutine.create(function()
        for i = 1, 5 do
            print("  Produced:", i)
            coroutine.yield(i)
        end
    end)
end

local function consumer(prod)
    while coroutine.status(prod) ~= "dead" do
        local ok, item = coroutine.resume(prod)
        if ok and item then print("  Consumed:", item) end
    end
end

print("=== Producer-Consumer ===")
consumer(producer())
