#!/usr/bin/env lua
--
-- Function to replace occurrences of a substring within a string
-- @param str: string to perform replacement on
-- @param find: substring to find
-- @param replace: substring to replace with
-- @return new string with replacements or error message
local function replace_string(str, find, replace)
    if not str or not find or not replace then
        return nil, "Error: Missing arguments. Usage: <script> <string> <find> <replace>"
    end
    return string.gsub(str, find, replace)
end

local str = arg[1]
local find = arg[2]
local replace = arg[3]

local new_string, err = replace_string(str, find, replace)

if err then
    print(err)
else
    print(new_string)
end
