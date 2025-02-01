#!/usr/bin/lua

-- Define a class named MyClass
local MyClass = {}

-- Constructor for MyClass
function MyClass:new()
	local new_obj = {}
	setmetatable(new_obj, self)
	self.__index = self
	return new_obj
end

-- Method to set a value in MyClass
function MyClass:setValue(value)
	self.value = value
end

-- Method to get the value from MyClass
function MyClass:getValue()
	return self.value
end

-- Define a subclass named SubClass that inherits from MyClass
local SubClass = MyClass:new()

-- Constructor for SubClass
function SubClass:new()
	return MyClass.new(self)
end

-- Method to get double the value from SubClass
function SubClass:getDoubleValue()
	return self.value * 2
end

-- Create an instance of MyClass and set a value
local GetNumber = MyClass:new()
GetNumber:setValue(100)
print(GetNumber:getValue()) -- Output: 100

-- Create an instance of SubClass and set a value
local DoubleNumber = SubClass:new()
DoubleNumber:setValue(GetNumber:getValue())
print(DoubleNumber:getDoubleValue()) -- Output: 200
