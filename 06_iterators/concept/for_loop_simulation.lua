#!/usr/bin/env lua
-- Simulate a numeric for loop with a while loop

local function for_loop(a, b, f)
    if type(a) ~= "number" or type(b) ~= "number" then
        error("a and b must be numbers")
    end
    while a < b do
        f(a)
        a = a + 1
    end
end

for_loop(1, 10, print)      -- prints 1..9

-- for_loop("a", 10, print) -- would error: "a and b must be numbers"
