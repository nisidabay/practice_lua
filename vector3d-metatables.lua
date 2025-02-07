#!/usr/bin/lua
--
-- Define the vector3d module and its metatable
-- In Lua, tables are used to represent objects, and metatables define their
-- behavior.

local vector3d = {}
local meta = {}

-- Constructor for creating a new vector3d object
-- This function simulates a class constructor, returning a new object (table)
-- with a metatable.
function vector3d.new(x, y, z)
	local v = { x = x, y = y, z = z }
	setmetatable(v, meta)
	meta.__index = vector3d -- Set __index to vector3d to allow method access
	return v
end

-- Metamethod for vector addition
function meta.__add(v1, v2)
	return vector3d.new(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
end

-- Metamethod for vector subtraction
-- This function allows the use of the '-' operator on vector3d objects.
function meta.__sub(v1, v2)
	return vector3d.new(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
end

-- Metamethod for converting a vector to a string
-- This function allows vector3d objects to be converted to a string using tostring().
function meta.__tostring(v)
	return string.format("(%f, %f, %f)", v.x, v.y, v.z)
end

-- Method to calculate the magnitude of the vector
-- This function is a method of the vector3d "class" and can be called on any
-- vector3d object.
function vector3d:magnitude()
	return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2)
end

-- Method to normalize the vector
-- This function returns a new vector3d object that is the normalized version of
-- the original.
function vector3d:normalize()
	local mag = self:magnitude()
	return vector3d.new(self.x / mag, self.y / mag, self.z / mag)
end

-- Create two vector3d objects
-- These objects are instances of the vector3d "class".
local velocity = vector3d.new(10.0, -3.5, 0.0)
local position = vector3d.new(5.0, 5.0, 5.0)

-- Perform vector addition and subtraction
-- The metamethods __add and __sub are used here.
local result_add = velocity + position
local result_sub = velocity - position

-- Calculate and print the magnitude of the velocity vector
print("Magnitude of velocity vector: " .. velocity:magnitude())

-- Normalize and print the velocity vector
local normalized_velocity = velocity:normalize()
print("Normalized velocity vector: " .. tostring(normalized_velocity))

-- Print the vectors using the tostring metamethod
print("Velocity vector: " .. tostring(velocity))
print("Position vector: " .. tostring(position))
print("Position + Velocity: " .. tostring(result_add))
print("Position - Velocity: " .. tostring(result_sub))
