#!/usr/bin/lua
local MyClass = {}

function MyClass:New()
	local new_obj = {}
	setmetatable(new_obj, self)
	self.__index = self
	return new_obj
end

function MyClass:setValue(value)
	self.value = value
end

function MyClass:getValue()
	return self.value
end

local GetNumber = MyClass:New()
GetNumber:setValue(100)
print(GetNumber:getValue())
