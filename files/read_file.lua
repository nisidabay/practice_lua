#!/usr/bin/env lua
--
-- Read a file
local file,err = io.open("myFile.txt", "r")
if file then
    local content = file:read("*a")
    print(content)
    file:close()
else
    print(err)
end
