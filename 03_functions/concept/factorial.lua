#!/usr/bin/env lua
-- Tail-recursive factorial: no stack growth on large n

local function fact_tail(n, acc)
    if n == 0 then return acc end
    return fact_tail(n - 1, n * acc)   -- tail call: last thing the function does
end

local function factorial(n)
    return fact_tail(n, 1)
end

for n = 0, 10 do
    print(string.format("%2d! = %d", n, factorial(n)))
end
