#!/usr/bin/env lua
--
-- Raises a custom error with a given message.
-- @param message: The error message to be displayed.
local function DivideByZeroError(message)
    error(">>> Divide by zero error: " .. message)
end

-- Divides x by y, raising a custom error if y is zero.
-- @param x: The numerator.
-- @param y: The denominator.
-- @return: The result of the division if y is not zero.
local function divide(x, y)
    if y == 0 then
        DivideByZeroError("y cannot be zero!")
    end
    return x / y
end

-- Example usage of the divide function.
print(divide(5, 2)) -- Outputs: 2.5
print(divide(5, 0)) -- Raises an error: "Divide by zero error: y cannot be zero"
