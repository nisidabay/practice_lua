#!/usr/bin/env lua
--
-- Interactive shell commands

local function run_command(command)
    local handle = io.popen(command)
    if handle == nil then
        return nil
    end
    for line in handle:lines() do
        print("Command output: " .. line)
        coroutine.yield()  -- Yield after each line of output
    end
    handle:close()
end

local ping_co = coroutine.create(run_command)
coroutine.resume(ping_co, "ping -c 5 google.com")
