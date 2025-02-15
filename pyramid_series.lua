#!/usr/sbin/lua
--
-- Calculate number of pyramid series
local function myfunc(series)
	local result = 0
	if series > 0 then
		for i = 1, series do
			result = result +  i
		end
		return result
	else
		return 0
	end
end

io.write("Enter the number of pyramid series:  ")
local input = io.read("*n")
if input then
	local result = myfunc(input)
	print(string.format("The pyramid series of %d is %d repetitions", input, result))
else
	print("Input must be a number")
end
