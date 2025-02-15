#!/usr/sbin/lua
--
-- Returning from the middle of a block
local function return_from_middle()
	print("Does get printed")
	do
		return true
	end
	print("Does not get printed")
end
return_from_middle()
