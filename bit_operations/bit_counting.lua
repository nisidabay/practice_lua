#!/usr/sbin/lua
--
-- Write a function that takes an integer as input, and returns the number of
-- bits that are equal to one in the binary representation of that number. You
-- can guarantee that input is non-negative.
--
-- Example: The binary representation of 1234 is 10011010010, so the function
-- should return 5 in this case

local function count_bits(n)
    local count = 0
    while n > 0 do
        count = count + (n % 2)
        n = math.floor(n / 2)
    end
    return count
end

-- Example usage
local number = 1234
print("Number of 1 bits in " .. number .. " is: " .. count_bits(number))
