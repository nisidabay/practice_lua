#!/usr/bin/lua
--
-- Define a class named MyClass
local MyClass = {}
MyClass.__index = MyClass

-- Constructor for MyClass
function MyClass:new()
	local new_obj = setmetatable({}, self)
	new_obj._value = nil -- Use a private field to store the value
	return new_obj
end

-- Method to set a value in MyClass with validation
function MyClass:setValue(value)
	if type(value) == "number" then
		self._value = value
	else
		error("Value must be a number")
	end
end

-- Method to get the value from MyClass
function MyClass:getValue()
	return self._value
end

-- Define a subclass named SubClass that inherits from MyClass
local SubClass = setmetatable({}, { __index = MyClass })
SubClass.__index = SubClass

-- Constructor for SubClass
function SubClass:new()
	local new_obj = MyClass.new(self)
	setmetatable(new_obj, self)
	return new_obj
end

-- Method to get double the value from SubClass
function SubClass:getDoubleValue()
	return self:getValue() * 2
end

-- Create an instance of MyClass and set a value
local GetNumber = MyClass:new()
GetNumber:setValue(100)
print(GetNumber:getValue()) -- Output: 100

-- Create an instance of SubClass and set a value
local DoubleNumber = SubClass:new()
DoubleNumber:setValue(GetNumber:getValue())
print(DoubleNumber:getDoubleValue()) -- Output: 200
