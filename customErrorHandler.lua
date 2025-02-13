#!/usr/bin/lua
--
-- Custom error handler
local function logError(err)
	print("Logging error: ", err)
	-- Here you could write the error to a file or send it to a logging service
end

-- This is a closure
local function safeSquareRoot(number)
	local function squareRoot()
		assert(number >= 0, "Cannot calculate the square root of a negative number.")
		return math.sqrt(number)
	end

	local status, result = xpcall(squareRoot, logError)
	if status then
		print("The square root is: " .. result)
	end
	-- The error handling is done by logError, no need for else
end

safeSquareRoot(100)
safeSquareRoot(-1) -- This will trigger the error handler
