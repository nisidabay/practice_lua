#!/usr/bin/env lua
-- List directory contents (stdlib only, no external deps)

local dir = arg[1] or "."

local function list(path)
    local h = io.popen('ls -lh "' .. path .. '" 2>/dev/null')
    if not h then
        print("Cannot access:", path)
        return
    end
    print("Contents of " .. path .. ":")
    print(h:read("*a"))
    h:close()
end

list(dir)
