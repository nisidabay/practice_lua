#!/usr/bin/env lua

--[[
    Determines if a given number is prime.

    @param num: The number to check. It should be a positive integer greater than 1.
    @return: Returns true if the number is prime.
             Returns false if the number is not prime.
<<<<<<< HEAD
=======
]]
local function is_prime(num)
    if num <= 1 then
        return false
    end
    for i = 2, math.sqrt(num) do
        if num % i == 0 then
            return false
        end
    end
    return true
end
>>>>>>> Snippet
local function is_prime(num)
    if num <= 1 then
        return false
    end
    for i = 2, math.sqrt(num) do
        if num % i == 0 then
            return false
        end
    end
    return true
end

print(is_prime(7))
print(is_prime(4))
print(is_prime(23))
