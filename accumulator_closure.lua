#!/usr/bin/env lua
--
-- Accumulator Closure
--
-- This script demonstrates the use of closures in Lua to create an accumulator
-- function.
-- An accumulator function maintains a running total of values passed to it.

-- makeAccumulator
-- This function creates and returns an accumulator function.
-- The accumulator function keeps track of a running total of all values passed to it.
-- @return function A closure that adds its argument to a running total and
-- returns the new total.
local function makeAccumulator()
    local total = 0
    return function(value)
        total = total + value
        return total
    end
end

-- Create an instance of the accumulator function.
local loopAccumulator = makeAccumulator()

-- Loop from 1 to 5, passing each value to the accumulator function and printing the result.
for i = 1, 5 do
    print("Value=", i, "Accumulator=", loopAccumulator(i))
end
