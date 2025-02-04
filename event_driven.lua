#!/usr/bin/env lua
--
-- Event-driven programming in Lua

local function watch_directory(path)
    local handle = io.popen("inotifywait -m -e create,delete " .. path)
    if handle == nil then
        return nil
    end
    for line in handle:lines() do
        print("Directory event: " .. line)
        coroutine.yield()  -- Yield after each event
    end
    handle:close()
end

local watch_co = coroutine.create(watch_directory)
coroutine.resume(watch_co, "/path/to/watch")
