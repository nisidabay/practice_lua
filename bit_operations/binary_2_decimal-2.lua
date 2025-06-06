#!/usr/sbin/lua
--
-- Convert from binary to decimal with validation
local function binary_to_decimal(binary_str)
	if not binary_str:match("^[01]+$") then
		error("Invalid binary number")
	end

	return tonumber(binary_str, 2)
end

local numbers = { "1100", "1111", "0001" }
for i, _ in ipairs(numbers) do
	print("Decimal of binary " .. numbers[i] .. " is: " .. binary_to_decimal(numbers[i]))
end
