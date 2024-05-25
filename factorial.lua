-- Lua script to calculate the factorial of a number.

-- Function to calculate the factorial of a number.
-- @param n The number for which to calculate the factorial.
-- @return The factorial of n.
local function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

-- Prompt the user to enter a number.
print("Enter a number: ")

-- Read user input and convert it to a number.
local a = tonumber(io.read())

-- Check if the input is a valid number.
if a then
    -- Calculate and print the factorial.
    local factorial = fact(a)
    print("Factorial of " .. a .. " is " .. factorial)
else
    print("Invalid input. Please enter a valid number.")
end
