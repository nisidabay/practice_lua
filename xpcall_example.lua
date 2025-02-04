#!/usr/bin/env lua
--
-- Use of xpcall, extended protective call
--
-- Custom error handler that formats the error message.
-- @param err The error message.
-- @return A formatted error message.
local function errorHandler(err)
	return "An error occurred: " .. err
end

-- Performs a risky operation that might throw an error.
-- @param x The first parameter.
-- @param y The second parameter.
-- @return The result of the operation if successful, or an error message if it fails.
local function riskyOperation(x, y)
	-- Example operation that might throw an error
	if y == 0 then
		error("Division by zero")
	end
	return x / y
end

-- Executes a risky operation and handles any errors that occur.
-- @param x The first parameter.
-- @param y The second parameter.
-- @return The result of the operation if successful, or an error message if it fails.
local function executeRiskyOperation(x, y)
	local _, result = xpcall(function()
		return riskyOperation(x, y)
	end, errorHandler)
	return result
end

-- Executes the script
-- @return The result of the operation if successful, or an error message if it fails.
local function main()
	print("Enter first number: ")
	local num1 = tonumber(io.read())
	print("Enter second number: ")
	local num2 = tonumber(io.read())

	if not num1 or not num2 then
		print("Invalid input. Please enter valid numbers.")
		return
	end

	local result = executeRiskyOperation(num1, num2)
	print(result)
end

main()
