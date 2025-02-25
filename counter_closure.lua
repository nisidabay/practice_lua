#!/usr/bin/env lua

-- This script demonstrates the use of closures in Lua to create a counter and a
-- function that adds a fixed number to its input.

-- Function to create a counter closure
-- @return A function that increments and returns the count each time it is called
local function makeCounter()
	local count = 0
	return function()
		count = count + 1
		return count
	end
end

-- Create a counter function using the closure
local counter = makeCounter()
print("Counter Example:")
print(counter()) -- Output: 1
print(counter()) -- Output: 2

-- Function to create a closure that adds a fixed number to its input
-- @return A function that adds a fixed number to the given value
local function add_number()
	local sum = 0
	local add = 5
	return function(value)
		sum = add + value
		return sum
	end
end

-- Create a function that adds 5 to its input
local add_five = add_number()
print("After adding 5: " .. add_five(5)) -- Output: 10
print("After adding 5: " .. add_five(10)) -- Output: 15

-- Function to text whether a number is less than N
-- @return boolean true if the number is less than N
local function make_less_than(n)
	return function(x)
		return x < n
	end
end
local less_than_five = make_less_than(5)
print(less_than_five(4))
print(make_less_than(10)(4))
