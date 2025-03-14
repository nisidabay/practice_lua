#!/usr/bin/env lua

-- Each instance is independent
local function newCalculator()
    local self = {
        value = 0,
        add = function(self, num)
            self.value = self.value + num
            return self.value
        end,
        subtract = function(self, num)
            self.value = self.value - num
            return self.value
        end
    }
    return self
end

local cal1 = newCalculator()
local cal2 = newCalculator()

print("cal1 adding: " .. cal1:add(2))
print("cal2 subtracting: " .. cal2:subtract(2))

print("cal1 value: " .. cal1.value)
print("cal2 value: " .. cal2.value)
