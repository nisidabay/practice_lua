#!/usr/bin/env lua
--- Closure Function Example
-- Demonstrates various closure patterns in Lua.
-- @module closure_function

local M = {}

--- PrependNumber module for prepending number words to strings
M.PrependNumber = {}

local function initPrependNumber()
    local numbers = { "one", "two", "three" }
    for num, num_name in ipairs(numbers) do
        M.PrependNumber[num] = function(str)
            return num_name .. ": " .. str
        end
    end
end

initPrependNumber()

-- Main execution
local function main()
    print(M.PrependNumber[1]("Hello"))
    print(M.PrependNumber[2]("Lua"))
    print(M.PrependNumber[3]("Weird"))
end

main()

return M
