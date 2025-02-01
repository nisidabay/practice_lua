#!/usr/bin/lua
-- Lua script demonstrating the use of a custom print function and a function that adds two numbers.

-- Custom print function that adds "##" around the printed text.
-- @param param The text to print.
local myprint = function(param)
   print("Print function: "..param)
end

-- Function to add two numbers and print the result using a custom print function.
-- @param num1 The first number to add.
-- @param num2 The second number to add.
-- @param functionPrint The custom print function to use for displaying the result.
function Add(num1, num2, functionPrint)
   local result = num1 + num2
   functionPrint(result)
end

-- Call the custom print function directly.
myprint(10)

-- Call the 'add' function to add 2 and 5 and print the result using 'myprint'.
Add(2, 5, myprint)
