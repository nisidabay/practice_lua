#!/usr/sbin/lua
--
-- Command line arguments in Lua
-- Check if the correct number of arguments are provided

if #arg < 3 then
	print("Usage: lua calculator.lua <number1> <number2> <operation>")
	print("Operations: add, subtract, multiply, divide, modulo")
	os.exit(1)
end

-- Convert the first two arguments to numbers
local num1 = tonumber(arg[1])
local num2 = tonumber(arg[2])

-- Check if the arguments are valid numbers
if not num1 or not num2 then
	print("Error: Both arguments must be valid numbers.")
	os.exit(1)
end

-- Define operations
local operations = {
	add = function(a, b)
		return a + b
	end,
	subtract = function(a, b)
		return a - b
	end,
	multiply = function(a, b)
		return a * b
	end,
	divide = function(a, b)
		if b == 0 then
			print("Error: Division by zero is not allowed.")
			os.exit(1)
		else
			return a / b
		end
	end,
	modulo = function(a, b)
		if b == 0 then
			print("Error: Modulo by zero is not allowed.")
			os.exit(1)
		else
			return math.fmod(a,b)
			-- or return a % b
		end
	end,
}

-- Determine the operation based on the third argument
local operation = arg[3]
local func = operations[operation]

if func then
	print(func(num1, num2))
else
	print("Error: Invalid operation. Valid operations are: add, subtract, multiply, divide, modulo")
	os.exit(1)
end
