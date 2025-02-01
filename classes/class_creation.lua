#!/usr/bin/lua
--
-- Define the MyClass table which will act as a class
local MyClass = {}

-- Creates a new instance of MyClass.
-- @return a new object
function MyClass:New()
    local new_obj = {}
    setmetatable(new_obj, self)
    self.__index = self
    return new_obj
end

-- Sets the value of the instance.
-- @param value The value to set.
function MyClass:setValue(value)
    self.value = value
end

-- Gets the value of the instance.
-- @return The value of the instance.
function MyClass:getValue()
    return self.value
end

-- Create a new instance of MyClass
local GetNumber = MyClass:New()

-- Set the value of the instance to 100
GetNumber:setValue(100)

-- Print the value of the instance
print(GetNumber:getValue())
