#!/usr/bin/env lua
--
-- Example of stateless iterator
local function square(up_to, current_number)
	if current_number < up_to then
		current_number = current_number + 1
		return current_number, current_number * current_number
	end
end

local function squares(up_to)
	return square, up_to, 0
end

for i, n in squares(3) do
	print(i, n)
end
--
-- square function is a stateless iterator because it does not maintain any
-- internal state between iterations. Instead, it relies on the parameters
-- passed to it to keep track of the iteration state. This makes it a simple and
-- efficient way to iterate over a sequence of values without the overhead of
-- maintaining state within the iterator itself.
