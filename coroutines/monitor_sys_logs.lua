#!/usr/sbin/lua
--
-- Monitor system logs
--
local function tail_log(filepath, keyword)
    local file = io.popen("tail -f " .. filepath)
    if not file then
        print("Failed to open file: " .. filepath)
        return
    end
    for line in file:lines() do
        if not line then
            break
        end
        if line:find(keyword) then
            print("Found keyword in log: " .. line)
        end
        coroutine.yield()  -- Yield to allow other tasks to run
    end
    file:close()
end

local log_monitor = coroutine.create(tail_log)
coroutine.resume(log_monitor, "/var/log/syslog", "error")
