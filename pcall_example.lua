#!/usr/sbin/lua
--
-- Use of pcall, protective call
--
-- Performs a risky operation that might throw an error.
-- @param x The first parameter.
-- @param y The second parameter.
-- @return The result of the operation if successful, or an error message if it fails.
local function riskyOperation(x, y)
	if y == 0 then
		error("Division by zero!")
	else
		return x / y
	end
end

local function main()
	print("Enter first number: ")
	local num1 = tonumber(io.read())
	print("Enter second number: ")
	local num2 = tonumber(io.read())

	if not num1 or not num2 then
		print("Invalid input. Please enter valid numbers.")
		return
	end

	local status, result = pcall(riskyOperation, num1, num2)
	if status then
		print("Operation successful: ", result)
	else
		print("Operation failed: ", result)
	end
end

main()
