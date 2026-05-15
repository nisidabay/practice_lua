#!/usr/bin/env lua
--- TypedToString Module
-- Converts a value to a string prefixed with its type.
-- @module typed_to_string

local M = {}

--- Converts a value to a string prefixed with its type.
-- @param value any The value to convert
-- @return string A formatted string with type and value, or error message if nil
function M.TypedToString(value)
    if value == nil then
        return "Invalid function call: nil value"
    end
    return string.format("%s: %s", type(value), tostring(value))
end

-- Main execution (demonstration)
local function main()
    print(M.TypedToString("abc"))
    print(M.TypedToString(123))
    print(M.TypedToString(true))
    print(M.TypedToString(function() end))
    print(M.TypedToString()) -- nil argument
end

main()
