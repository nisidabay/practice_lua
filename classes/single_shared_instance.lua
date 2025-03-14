#!/usr/sbin/lua
--
-- Creates a single global table called calculator
-- Changes in cal1 or cal2 affect each other
Calculator = {
    value = 0,
    add = function(self, num)
        self.value = self.value + num
        return self.value
    end,
    substract = function(self, num)
        self.value = self.value - num
        return self.value
    end
}
local cal1 = Calculator

print("cal1 adding: " .. cal1:add(2))
print("cal1 adding:" ..cal1:add(2))

local cal2 = Calculator

print("cal2 substracting: "..cal2:substract(2))
print("cal2 substracting: "..cal2:substract(2))

print("cal1 value: ".. cal1.value)
print("cal2 value: ".. cal2.value)

