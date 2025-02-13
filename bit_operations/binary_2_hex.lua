#!/usr/sbin/lua
--
-- Convert from binary to hexadecimal with validation
local function binary_to_hexadecimal(binary_str)
	if not binary_str:match("^[01]+$") then
		error("Invalid binary number")
	end

	local decimal=tonumber(binary_str,2)
	return string.upper(string.format("%x", decimal))
end

local numbers = { "1100", "1111", "0001" }
for i, _ in ipairs(numbers) do
	print("Decimal of hexadecimal" .. numbers[i] .. " is: " .. binary_to_hexadecimal(numbers[i]))
end
