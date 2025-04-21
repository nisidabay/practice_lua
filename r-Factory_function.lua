#!/usr/bin/env lua
-- Creates a new independent calculator instance
local function newCalculator()
	-- Initialize the calculator's state with a default value of 0
	local self = {
		value = 0,
		-- Method to add a number to the current value
		add = function(self, num)
			-- Update the value by adding the provided number
			self.value = self.value + num
			-- Return the updated value
			return self.value
		end,
		-- Method to subtract a number from the current value
		subtract = function(self, num)
			-- Update the value by subtracting the provided number
			self.value = self.value - num
			-- Return the updated value
			return self.value
		end,
	}
	-- Return the newly created calculator instance
	return self
end

-- Create two independent calculator instances
local cal1 = newCalculator()
local cal2 = newCalculator()

-- Demonstrate the usage of each calculator instance
print("cal1 adding: " .. cal1:add(2))
print("cal2 subtracting: " .. cal2:subtract(2))

-- Verify that modifications to one instance do not affect the other
print("cal1 value: " .. cal1.value)
print("cal2 value: " .. cal2.value)
