#!/usr/bin/env lua
--- Counter Closure Module
-- Demonstrates the use of closures in Lua to create counters and other functional patterns.
-- @module counter_closure

local M = {}

--- Creates a counter closure that increments and returns the count each time it is called.
-- @return function A closure that increments and returns the count
function M.makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

--- Creates a closure that adds a fixed number (5) to its input.
-- @return function A closure that adds 5 to the given value
function M.addNumber()
    local add = 5
    return function(value)
        return add + value
    end
end

--- Creates a closure that checks if a number is less than N.
-- @param n number The threshold value
-- @return function A closure that returns true if x < n
function M.makeLessThan(n)
    return function(x)
        return x < n
    end
end

-- Main execution
local function main()
    -- Counter example
    print("Counter Example:")
    local counter = M.makeCounter()
    print(counter()) -- Output: 1
    print(counter()) -- Output: 2

    -- Add five example
    local add_five = M.addNumber()
    print("After adding 5: " .. add_five(5)) -- Output: 10
    print("After adding 5: " .. add_five(10)) -- Output: 15

    -- Less than example
    local less_than_five = M.makeLessThan(5)
    print(less_than_five(4)) -- Output: true
    print(M.makeLessThan(10)(4)) -- Output: true
end

main()

return M
