#!/usr/bin/lua
local age = 15
local legal_age = 16

if age > legal_age then
    print("You can vote and drink")
elseif age <legal_age then
    print("You cannot neither vote nor drink")
end


print("Showing random numbers from 0,20")
math.randomseed(os.time())
local r = math.random(0,20)
print("Random number: "..r)
