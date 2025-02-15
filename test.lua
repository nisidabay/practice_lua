#!/usr/sbin/lua
--
-- Check if a string is even
function EvenLen(str)
	local ret
	if #str % 2 == 0 then
		ret = true
	else
		ret = false
	end
	return ret
end
print(EvenLen("Carlos"))
print(EvenLen("Carlota"))
