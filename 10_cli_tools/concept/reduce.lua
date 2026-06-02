#!/usr/bin/env lua

-- Applies a function `f` to an accumulator and each number from 0 to `max-1`
-- `max`: the upper limit (exclusive) for the iteration
-- `init`: the initial value for the accumulator
-- `f`: the function to apply, taking the accumulator and the current number
local function reduce(max, init, f)
    local acc = init
    for i = 0, max do
        acc = f(acc, i)
    end
    print(acc)
end

-- Adds two numbers
-- `previous`: the current value of the accumulator
-- `next`: the current number in the iteration
local function add(previous, next)
    return previous + next
end

reduce(5, 0, add)
