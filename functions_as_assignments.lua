#!/usr/sbin/lua

-- Function to sum a variable number of arguments
local function add(...)
	local sum = 0
	for _, value in ipairs({ ... }) do
		sum = sum + value
	end
	return sum
end

-- Print the result of calling `add` with arguments 1, 2, 3, 4.
print(add(1, 2, 3, 4)) -- Output: 10

-- Anonymous function to sum and print a variable number of arguments
local printSum = function(...)
	local sum = 0
	for _, value in ipairs({ ... }) do
		sum = sum + value
	end
	print(sum)
end

-- Call the anonymous function with arguments 1, 2, 3, 4.
printSum(1, 2, 3, 4)


-- This will always create different functions
local function do_nothing()
	return function() end
end

local d1= do_nothing()
local d2= do_nothing()
print(d1)
print(d2)
print(d1==d2)
