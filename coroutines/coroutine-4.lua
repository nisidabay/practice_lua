#!/usr/sbin/lua
--
-- Task function
local function task(name, duration)
    print(name .. " started")
    coroutine.yield()
    print(name .. " completed after " .. duration .. " seconds")
end

-- Creating coroutines for tasks
local task1 = coroutine.create(function() task("Task 1", 2) end)
local task2 = coroutine.create(function() task("Task 2", 3) end)

-- Simulating a scheduler
while coroutine.status(task1) ~= "dead" or coroutine.status(task2) ~= "dead" do
    if coroutine.status(task1) ~= "dead" then
        coroutine.resume(task1)
    end
    if coroutine.status(task2) ~= "dead" then
        coroutine.resume(task2)
    end
end
