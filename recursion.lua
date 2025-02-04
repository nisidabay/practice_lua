#!/usr/bin/env lua
--
-- Recursive function to demonstrate a simple recursion pattern
local function recursiveLoop(currentStep, maxSteps)
	-- Increment the current step
	currentStep = currentStep + 1
	print("In recursive loop: Step " .. currentStep)

	-- Base case: stop recursion if the current step reaches maxSteps
	if currentStep < maxSteps then
		recursiveLoop(currentStep, maxSteps)
	end
	print("Exiting recursive loop. Step: " .. currentStep)
-- Start the recursive loop with an initial step of 0 and a maximum of 4 steps

	print("Exiting recursive loop. Step: " .. currentStep)
end

-- Start the recursive loop with an initial step of 0 and a maximum of 4 steps
recursiveLoop(0, 4)
