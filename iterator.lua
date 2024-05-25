#!/usr/bin/lua

function Iterator()
	local number = 0
	return function()
		number = number + 1
		return number
	end
end

next = Iterator()
for _ = 1, 20 do
	print(next())
end
