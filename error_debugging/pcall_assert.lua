#!/usr/sbin/lua
--
-- Using pcall and assert

-- Function that raise an error
local function divide(a, b)
	if b == 0 then
		error("Cannot divide by zero!")
	else
		return a / b
	end
end

local success, result = pcall(divide(10, 0))
if success then
	print("Result: ", result)
else
	print("Error: ", result)
end

-- Comment out the previous function
local x=10
local y=20

assert(x==y, "x and y must be equal")
