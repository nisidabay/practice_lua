#!/usr/bin/lua
-- Lua script to calculate the average of numbers entered by the user.

-- Function to calculate the average of a list of numbers.
-- @param ... A variable number of numerical arguments.
-- @return The average of the provided numbers.
local function average(...)
	local result = 0
	local args = { ... } -- Pack the arguments into a table.

	for _, v in pairs(args) do
		result = result + v
	end

	return result / #args -- Calculate the average.
end

-- Function to read a list of numbers from the user.
-- @return A table containing the user-entered numbers.
local function readNumbers()
	local numbers = {}
	while true do
		print("Enter a number (or 'q' to calculate the average): ")
		local input = io.read()

		if input == "q" then
			break
		else
			local number = tonumber(input)
			if number then
				table.insert(numbers, number)
			else
				print("Invalid input. Please enter a valid number or 'q' to calculate the average.")
			end
		end
	end
	return numbers
end

-- Read numbers from the user and calculate the average.
local userNumbers = readNumbers()
local avg = average(table.unpack(userNumbers))
print("The average is: " .. avg)
