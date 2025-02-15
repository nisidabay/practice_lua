#!/usr/sbin/lua
--
-- Check if a string is even
local function evenLen(str)
	local ret
	if #str % 2 == 0 then
		ret = true
	else
		ret = false
	end
	return ret
end
print(evenLen("Carlos"))
print(evenLen("Carlota"))
