#!/usr/bin/env lua
--
-- Closure that counts odd and even numbers

local function countOddEven()
	local odd_counter = 0
	local even_counter = 0
	return function(value)
		if value % 2 == 0 then
			even_counter = even_counter + 1
		else
			odd_counter = odd_counter + 1
		end
		return odd_counter, even_counter
	end
end

local counterFunction = countOddEven()
local odd
local even
for i = 1, 1000 do
	odd, even = counterFunction(i)
end
print("Odd numbers: ", odd)
print("Even numbers: ", even )

