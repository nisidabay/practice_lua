#!/usr/bin/env lua
local function is_prime(n)
    if n < 2 then return false end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then return false end
    end
    return true
end

for i = 2, 20 do
    if is_prime(i) then print(i, "is prime") end
end
