#!/usr/bin/lua
local MyClass = {}

function MyClass:new()
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

-- Inheriting from MyClass
local SubClass = MyClass:new()
function SubClass:new()
	local new_obj = {}
	setmetatable(new_obj, self)
	self.__index = self
	return new_obj
end
function SubClass:getDoubleValue()
	return self.value * 2
end

local GetNumber = MyClass:new()
GetNumber:setValue(100)
print(GetNumber:getValue())

local DoubleNumber = SubClass:new()
DoubleNumber:setValue(100)
print(DoubleNumber:getDoubleValue())
