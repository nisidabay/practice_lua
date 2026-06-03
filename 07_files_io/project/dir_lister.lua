#!/usr/bin/env lua
-- List directory contents with sizes and dates (requires lfs)

local dir = arg[1] or "."

local function list(path)
    local lfs = require("lfs")
    print("Contents of " .. path .. ":")
    print(string.format("%-25s %10s  %s", "NAME", "SIZE", "MODIFIED"))
    print(string.rep("-", 55))

    for f in lfs.dir(path) do
        if f ~= "." and f ~= ".." then
            local attr = lfs.attributes(path .. "/" .. f)
            if attr then
                print(string.format("%-25s %10d  %s",
                    f, attr.size or 0, os.date("%Y-%m-%d", attr.modification)))
            end
        end
    end
end

local ok, err = pcall(list, dir)
if not ok then print("Error: lfs not installed? (luarocks install luafilesystem)") end
