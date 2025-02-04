#!/usr/bin/env lua
--
-- Find max number with variadic arguments
--
local function find_max(...)
	local counter = 0
	local arguments = { ... }
	local max = arguments[1]

	for i, num in ipairs(arguments) do
		if num > max then
			max = num
			counter = i
		end
	end

	return max, counter
end

local max, counter= find_max(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 100, 16, 17, 18, 19, 20)
print("Max number is " .. max .. " at position " .. counter)
