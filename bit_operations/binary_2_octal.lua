#!/usr/sbin/lua
--
-- Convert from binary to octal with validation
local function binary_to_octal(binary_str)
	if not binary_str:match("^[01]+$") then
		error("Invalid binary number")
	end

	local decimal = tonumber(binary_str, 2)
	return string.upper(string.format("%o", decimal))
end

local numbers = { "1100", "1111", "0001" }
for i, _ in ipairs(numbers) do
	print("Decimal of octal" .. numbers[i] .. " is: " .. binary_to_octal(numbers[i]))
end
