#!/usr/bin/env lua
-- exercises.lua — Coroutines practice. Run: lua exercises.lua

print("=== Ex 1: Basic create/resume ===")
local co = coroutine.create(function()
    print("  step 1")
    coroutine.yield()
    print("  step 2")
    coroutine.yield()
    print("  step 3")
end)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print("  status:", coroutine.status(co))
print()

print("=== Ex 2: Yield with values ===")
local producer = coroutine.create(function()
    for i = 1, 3 do
        coroutine.yield(i * 10)
    end
end)
local ok, val = coroutine.resume(producer)
print("  resume 1:", val)
ok, val = coroutine.resume(producer)
print("  resume 2:", val)
ok, val = coroutine.resume(producer)
print("  resume 3:", val)
ok, val = coroutine.resume(producer)
print("  status:", coroutine.status(producer))
print()

print("=== Ex 3: Producer-consumer ===")
local function receive(prod)
    local results = {}
    while coroutine.status(prod) ~= "dead" do
        local ok, val = coroutine.resume(prod)
        if ok and val then results[#results + 1] = val end
    end
    return results
end

local prod = coroutine.create(function()
    coroutine.yield("apple")
    coroutine.yield("banana")
    coroutine.yield("cherry")
end)
local items = receive(prod)
print("  items:", table.concat(items, ", "))
print()

print("=== Ex 4: Wrap (simpler API) ===")
local f = coroutine.wrap(function()
    print("  hello from wrap")
end)
f()
print()

print("=== Ex 5: Pipeline coroutines ===")
local function doubler()
    while true do
        local n = coroutine.yield()
        print(string.format("  doubled: %d -> %d", n, n * 2))
    end
end

local d = coroutine.create(doubler)
coroutine.resume(d) -- prime it
coroutine.resume(d, 5)
coroutine.resume(d, 10)
coroutine.resume(d, 15)
print()

print("=== BONUS: Round-robin scheduler ===\n")
local function task(name, count)
    return function()
        for i = 1, count do
            print(string.format("  [%s] step %d/%d", name, i, count))
            coroutine.yield()
        end
    end
end

local tasks = {
    coroutine.create(task("A", 2)),
    coroutine.create(task("B", 3)),
    coroutine.create(task("C", 1)),
}

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
print("  scheduler done")
