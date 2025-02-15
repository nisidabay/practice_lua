#!/usr/bin/lua
--
-- Simulate a pipeline of commands with coroutines
--

local function ls()
    local handle = io.popen("ls")
    if handle == nil then
        return nil
    end
    for filename in handle:lines() do
        coroutine.yield(filename)  -- Yield the filename after each line of output
    end
    handle:close()
end

local function grep(pattern)
    local co = coroutine.create(ls)
    while true do
        local status, filename = coroutine.resume(co)
        if not status or filename == nil then break end
        if filename:find(pattern) then
            print("Found file: " .. filename)
        end
    end
end

grep(".lua")
