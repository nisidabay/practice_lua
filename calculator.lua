#!/usr/bin/env lua
--- Calculator Module
-- Performs basic arithmetic operations based on command-line arguments.
-- @module calculator

local M = {}

--- Validates that both arguments are valid numbers.
-- @param num1 First number to validate
-- @param num2 Second number to validate
-- @return boolean true if both are valid numbers, false otherwise
local function validateNumbers(num1, num2)
    return num1 ~= nil and num2 ~= nil
end

--- Defines available arithmetic operations.
-- @return table A table of operation functions
local function getOperations()
    return {
        add = function(a, b) return a + b end,
        subtract = function(a, b) return a - b end,
        multiply = function(a, b) return a * b end,
        divide = function(a, b)
            if b == 0 then
                error("Division by zero is not allowed.")
            end
            return a / b
        end,
        modulo = function(a, b)
            if b == 0 then
                error("Modulo by zero is not allowed.")
            end
            return math.fmod(a, b)
        end,
    }
end

--- Displays usage information and exits.
local function showUsage()
    print("Usage: lua calculator.lua <number1> <number2> <operation>")
    print("Operations: add, subtract, multiply, divide, modulo")
    os.exit(1)
end

--- Main function to execute the calculator.
-- @param args Table of command-line arguments
function M.run(args)
    -- Validate argument count
    if #args < 3 then
        showUsage()
    end

    -- Parse and validate numbers
    local num1 = tonumber(args[1])
    local num2 = tonumber(args[2])

    if not validateNumbers(num1, num2) then
        print("Error: Both arguments must be valid numbers.")
        os.exit(1)
    end

    -- Get operation
    local operation = args[3]
    local operations = getOperations()
    local func = operations[operation]

    if not func then
        print("Error: Invalid operation. Valid operations are: add, subtract, multiply, divide, modulo")
        os.exit(1)
    end

    -- Execute operation with error handling
    local success, result = pcall(func, num1, num2)
    if success then
        print(result)
    else
        print("Error: " .. result)
        os.exit(1)
    end
end

-- Run if executed directly
if arg and arg[0] then
    M.run(arg)
end
