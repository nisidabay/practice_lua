#!/usr/bin/lua

--Factorial example
--From the book Lua Programming: The Ultimate Beginners's Guide to Learl Lua
--Step by Step

function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

print("Enter a number: ")
a = io.read()
print(fact(a))
