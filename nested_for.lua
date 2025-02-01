#!/usr/bin/lua
-- Lua script to find prime numbers within a range.

-- Function to check if a number is prime.
-- @param num The number to check for primality.
-- @return True if num is prime, false otherwise.
local function isPrime(num)
    if num <= 1 then
        return false
    end
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end
    return true
end

-- Loop through numbers from 2 to 10 to find prime numbers.
for i = 2, 10 do
    if isPrime(i) then
        print("Prime number:", i)
    end
end
