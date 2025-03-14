#!/usr/bin/env lua

-- A generic reduce function that applies a binary function `f` to an accumulator
-- and each number from 1 to `max`.
-- `max`: the upper limit (inclusive) for the iteration
-- `init`: the initial value for the accumulator
-- `f`: the function to apply, taking the accumulator and the current number
local function reduce(max, init, f)
    local acc = init
    for i = 1, max do
        acc = f(acc, i) -- Apply the function `f` to the accumulator and the current index
    end
    return acc          -- Return the accumulated result
end

-- Multiplies two numbers
-- `previous`: the current value of the accumulator
-- `next`: the current number in the iteration
local function multiply(previous, next)
    return previous * next
end

-- Calculates the factorial of a number `n`
-- `n`: the number to calculate the factorial for
-- Uses the `reduce` function with multiplication to compute the factorial
local function factorial(n)
    return reduce(n, 1, multiply)
end

-- Test the factorial function
-- This will print the factorial of 5, which is 120
print(factorial(5)) -- Output should be 120
