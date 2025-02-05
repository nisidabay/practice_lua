#!/usr/bin/lua
--
-- Fibonacci iterator
local function fibonacci()
	local a, b = 0, 1
	return function()
		a, b = b, a + b
		return a
	end
end

local next_element = fibonacci()
for _ = 1, 30 do
	print(next_element())
end
