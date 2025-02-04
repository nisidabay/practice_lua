#!/usr/bin/env lua
--
-- Return the product of the number x and the random number f
-- Or otherwise return the string "f is odd"

local function test(x)
    local f = math.random(10) -- random between 1 and 10 inclusive
  if f % 2 == 0 then return (f*x).." " ..x.. " "..f
    else return "f is odd"
    end
end

print(test(2))

-- Return x*y if y is greater than or equal to z and "Lua"
-- Or otherwise return x*y and "Codewars"
local function firstlua(x,y,z)
    if y>=z then return x.." "..x*y.." ".."Lua"
    else
    return x.." "..x*y.." ".."Codewars"
    end
end
print(firstlua(1,2,3))
print(firstlua(3,2,1))

