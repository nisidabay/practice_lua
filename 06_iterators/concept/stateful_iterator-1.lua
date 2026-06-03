#!/usr/bin/env lua
-- stateful iterator: closure remembers currentNumber across calls

local function squares(limit)
    local currentNumber = 0
    return function()
        currentNumber = currentNumber + 1
        if currentNumber <= limit then
            return currentNumber, currentNumber * currentNumber
        end
    end
end

for num, sq in squares(4) do
    print(string.format("%d^2 = %d", num, sq))
end
