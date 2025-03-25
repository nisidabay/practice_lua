#!/usr/bin/env lua
--
-- Each instance is independent
local function newCalculator()
    local self = {
        value = 0
    }

    function self:add(num)
        self.value = self.value + num
        return self.value
    end

    function self:subtract(num)
        if num > self.value then
            error(">>> You can't subtract more than the current value!")
        end
        self.value = self.value - num
        return self.value
    end

    return self
end

local cal1 = newCalculator()
local cal2 = newCalculator()

print("cal1 adding: " .. cal1:add(4))
print("cal1 subtracting: " .. cal1:subtract(2))
print("cal1 value: " .. cal1.value)

print("cal2 adding: " .. cal2:add(2))
print("cal2 subtracting: " .. cal2:subtract(2))
print("cal2 value: " .. cal2.value)
