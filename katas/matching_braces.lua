#!/usr/sbin/lua
--
-- Matching braces
--
-- Write a function that takes a string of braces, and determines if the order
-- of the braces is valid. It should return true if the string is valid, and
-- false if it's invalid.
--

--- Checks if a string of braces is valid.
-- A string of braces is considered valid if all opening braces have a corresponding
-- closing brace in the correct order.
-- @param str_of_braces A string containing braces '()', '[]', and '{}'.
-- @return boolean True if the string is valid, false otherwise.
local function validBraces(str_of_braces)
    -- Create a stack (using a table in Lua)
    local stack = {}

    -- Define matching pairs
    local matchingBraces = {
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
    }

    -- Iterate over each character in the string
    for i = 1, #str_of_braces do
        local char = str_of_braces:sub(i, i)

        -- If it's an opening brace, push to stack
        if char == "(" or char == "[" or char == "{" then
            table.insert(stack, char)
        else
            -- If it's a closing brace, check if it matches the top of the stack
            if #stack == 0 then
                return false
            end

            local lastOpen = table.remove(stack) -- Pop the last opening brace
            if matchingBraces[lastOpen] ~= char then
                return false
            end
        end
    end

    -- If the stack is empty, all braces were matched correctly
	-- This returns "true"
    return #stack == 0
end

-- Test cases
print(validBraces("(){}[]")) -- True
print(validBraces("([{}])")) -- True
print(validBraces("(}")) -- False
print(validBraces("[(])")) -- False
print(validBraces("[({})](]")) -- False
