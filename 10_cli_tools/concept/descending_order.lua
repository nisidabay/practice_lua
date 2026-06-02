#!/usr/bin/env lua
--
--  Make a function that can take any non-negative integer as an argument and
--  return it with its digits in descending order. Essentially, rearrange the
--  digits to create the highest possible number.
--
local function descending_order(n)
	if n < 0 then
		return nil
	end

	local chars = {}
	local str = tostring(n)
	for c in str:gmatch(".") do
		table.insert(chars, c)
	end

	table.sort(chars, function(a, b)
		return a > b
	end)

	local result = table.concat(chars)
	return result
end

-- Example usage:
print(descending_order(42145)) -- Output: 54421
print(descending_order(145263)) -- Output: 654321
print(descending_order(123456789)) -- Output: 987654321
print(descending_order(-123456789)) -- Output: nil
