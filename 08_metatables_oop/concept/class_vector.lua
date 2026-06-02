#!/usr/sbin/lua
--
-- Class Vector
-- This script defines a simple Vector class in Lua with basic functionalities.

-- The Vector class has three properties: x, y, and z, which represent the
-- coordinates of the vector.

-- It includes methods for creating new vector instances and printing the
-- vector's coordinates.

-- Define the Vector class with default values for x, y, and z.
Vector = { x = 0, y = 1, z = 0 }

-- Method to create a new instance of the Vector class.
-- @param self The class itself.
-- @param object (optional) A table containing initial values for the vector's properties.
-- @return A new instance of the Vector class.
Vector.new = function(self, object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	return object
end

-- Method to print the coordinates of the vector.
-- @param self The instance of the Vector class.
Vector.print = function(self)
	print("x:" .. self.x .. ",y: " .. self.y .. ",z:" .. self.z)
end

-- Create a new instance of the Vector class with default values.
local velocity = Vector:new()

-- Create a new instance of the Vector class with specified values for x and z.
local momentum = Vector:new({ x = 20, z = 10 })

-- Print the coordinates of the velocity vector.
velocity:print()

-- Print the coordinates of the momentum vector.
momentum:print()
