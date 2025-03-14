#!/usr/bin/env lua
--
-- for loop simulation using a while loop
local function for_loop(a, b, f)
    if not a or not b or not f then
        return "missing arguments"
    end
    if type(a) ~= "number" or type(b) ~= "number" then
<<<<<<< HEAD
        error("a and b must be numbers", 1)
=======
        return "a and b must be numbers"
>>>>>>> Snippet
    end

    while a < b do
        f(a)
        a = a + 1
    end
end

-- Example usage: print numbers from 1 to 9
for_loop(1, 10, print)
<<<<<<< HEAD
for_loop("a", 10, print)
=======

>>>>>>> Snippet
