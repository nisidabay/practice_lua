#!/usr/bin/env lua

local defaults = { x = 0, y = 0 }
local mt = {
	__index = function(tbl, key)
		if key == "x" or key == "y" then
			return defaults[key]
		else
			return "No key found"
		end
	end,
	__newindex=function(tbl,key,value)
		return rawset(tbl,key, value)
	end
}
local mytable = setmetatable({}, mt)
mytable.z=10
print(mytable.x)
print(mytable.y)
print(mytable.z)
