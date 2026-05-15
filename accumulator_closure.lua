#!/usr/bin/env lua
--- Accumulator Closure Module
-- Demonstrates the use of closures in Lua to create an accumulator function.
-- @module accumulator_closure

--- Creates an accumulator function that maintains a running total.
-- @return function A closure that adds its argument to a running total and returns the new total.
local function makeAccumulator()
    local total = 0
    return function(value)
        total = total + value
        return total
    end
end

-- Main execution
local function main()
    local accumulator = makeAccumulator()

    -- Loop from 1 to 5, accumulating and printing results
    for i = 1, 5 do
        print(string.format("Value=%d, Accumulator=%d", i, accumulator(i)))
    end
end

main()
