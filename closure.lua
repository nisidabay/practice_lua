#!/usr/sbin/lua

-- Closure examples

-- Example 1: Counter function This function demonstrates a simple counter using
-- closures. The `counter` variable holds the anonymous function, and each time
-- it's called, it accesses and modifies the same `count` variable that was
-- created when `makeCounter()` was initially called. This is possible because
-- the anonymous function forms a closure, "closing over" the `count` variable.

local function makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

-- Call the counter function
local counter = makeCounter()
print("Counter Example:")
print(counter()) -- Output: 1
print(counter()) -- Output: 2

-- Example 2: Accumulator function This function demonstrates an accumulator
-- that adds a given value to a running total. The `accumulator` variable holds
-- the anonymous function, and each time it's called, it accesses and modifies
-- the same `total` variable that was created when `makeAccumulator()` was
-- initially called.

local function makeAccumulator()
    local total = 0
    return function(value)
        total = total + value
        return total
    end
end

local loopAccumulator = makeAccumulator()
for i = 1, 5 do
    print("Value=",i , "Accumulator=", loopAccumulator(i))
end
