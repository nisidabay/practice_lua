#!/usr/bin/lua
--
-- TypedToString Function
-- Converts a value to a string and prefixes that string with the value's type.
local function TypedToString(value)
    if value == nil then
        return "Invalid function call"
    end
    return string.format("%s: %s", type(value), tostring(value))
end

print(TypedToString("abc"))
print(TypedToString(123))
print(TypedToString(true))
print(TypedToString(function() end))
print(TypedToString())
