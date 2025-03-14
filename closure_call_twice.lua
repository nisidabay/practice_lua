#!/usr/bin/env lua

-- Function that takes another function 'f' and returns a new function
-- This new function applies 'f' twice to its input
local function call_twice(f)
	return function(num)
		return f(f(num))
	end
end

-- Function that triples its input
local function triple(n)
	return n * 3
end

-- Create a new function that applies 'triple' twice
local times_nine = call_twice(triple)

-- Print the result of applying 'times_nine' to 5
-- This effectively triples 5 twice, resulting in 5 * 3 * 3 = 45
print(times_nine(5))
