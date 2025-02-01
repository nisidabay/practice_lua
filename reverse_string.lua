#!/usr/sbin/lua
--
-- Reverse string
local function reverseString(str)

    local reversedStr = ""
    for i= #str, 1, -1 do
        reversedStr= reversedStr .. string.sub(str, i,i)
    end
    return reversedStr
end

local originalString = "Hello, World!"
local reversedString = reverseString(originalString)

print("Original string: " .. originalString)
print("Reversed string: " .. reversedString)
