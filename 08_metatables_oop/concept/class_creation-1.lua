#!/usr/bin/lua
--
-- Define the MyClass table which will act as a class
local MyClass = {}
MyClass.__index = MyClass

-- Creates a new instance of MyClass.
-- @return a new object
function MyClass:New()
	-- The empty table represents the object
	local instance = {}
	local new_obj = setmetatable(instance, MyClass)
	new_obj._value = nil -- Use a private field to store the value
	return new_obj
end

-- Sets the value of the instance with validation.
-- @param value The value to set.
function MyClass:setValue(value)
	if type(value) == "number" then
		self._value = value
	else
		error("Value must be a number")
	end
end

-- Gets the value of the instance.
-- @return The value of the instance.
function MyClass:getValue()
	return self._value
end

-- Create a new instance of MyClass
local GetNumber = MyClass:New()

-- Set the value of the instance to 100
GetNumber:setValue(100)

-- Print the value of the instance
print(GetNumber:getValue())
