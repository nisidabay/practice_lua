#!/usr/sbin/lua
--
-- Convert from binary to decimal with validation
local function binary_to_decimal(binary_str)
	if not binary_str:match("^[01]+$") then
		error("Invalid binary number")
	end

	local decimal = 0
	local length = #binary_str

	for i = 1, length do
		local bit = binary_str:sub(i, i)
		if bit == "1" then
			decimal = decimal + 2 ^ (length - i)
		end
	end

	return string.format("%d", decimal)
end

local numbers = { "1100", "1111", "0001" }
for i, _ in ipairs(numbers) do
	print("Decimal of binary " .. numbers[i] .. " is: " .. binary_to_decimal(numbers[i]))
end
