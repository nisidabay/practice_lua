#!/usr/bin/lua

local function fibonacci()
	local a, b = 0, 1
	return function()
		a, b = b, a + b
		return a
	end
end
local next_element = fibonacci()
print(next_element())
print(next_element())
print(next_element())
