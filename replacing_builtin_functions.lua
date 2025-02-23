#!/usr/sbin/lua
--
-- Give the print function another name
RealPrint=print

-- Define a new function called FakePrint that takes one argument (Val)
function FakePrint(Val)
    -- Call the original print function (now named RealPrint) with a custom message and the value of Val
    RealPrint("Inside FakePrint:", Val)
end

-- Call the FakePrint function with the argument "Hello"
FakePrint("Hello")
print(print==RealPrint)
print(type(print))
print(print)
print(type(RealPrint))
print(RealPrint)
