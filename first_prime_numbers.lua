#!/usr/bin/env lua

-- Function to check if a number is prime
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

-- Function to check if a number ends in 3
local function ends_in_3(num)
    -- return tostring(num):sub(-1) == "3". THIS IS SYNTACTIC SUGAR
    return tostring(num).sub(num, -1) == "3"
end

-- Function to print the first n prime numbers that end in 3
local function first_prime_numbers_ending_in_3(n)
    local count = 0
    local num = 2
    while count < n do
        if is_prime(num) and ends_in_3(num) then
            print(num)
            count = count + 1
        end
        num = num + 1
    end
end

-- Example usage: print the first 5 prime numbers that end in 3
first_prime_numbers_ending_in_3(5)
