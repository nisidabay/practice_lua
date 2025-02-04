#!/usr/bin/env lua
--
-- Accumulator Closure
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
