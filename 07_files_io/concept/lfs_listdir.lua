#!/usr/bin/env lua
-- lfs (LuaFileSystem) -- optional library: luarocks install luafilesystem

local lfs = require("lfs")
local dir = arg[1] or "."

for file in lfs.dir(dir) do
    if file ~= "." and file ~= ".." then
        local attr = lfs.attributes(dir .. "/" .. file)
        if attr then
            print(string.format("%-20s %10d  %s",
                file, attr.size or 0, os.date("%Y-%m-%d", attr.modification)))
        end
    end
end
