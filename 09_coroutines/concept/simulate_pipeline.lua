#!/usr/bin/env lua
-- Pipeline: ls -> grep -> print (each stage is a coroutine yielding values)

local function ls(dir)
    local h = io.popen("ls " .. (dir or "."))
    return coroutine.wrap(function()
        for f in h:lines() do coroutine.yield(f) end
        h:close()
    end)
end

local function grep(pattern, source)
    return coroutine.wrap(function()
        for item in source do
            if item:find(pattern) then coroutine.yield(item) end
        end
    end)
end

print("Files with 'lua':")
for f in grep("lua", ls(".")) do
    print(" ", f)
end
