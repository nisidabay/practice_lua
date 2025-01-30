#!/usr/bin/lua
--
-- Define a metatable for vector3d operations
local vector3dMetatable = {}

-- Define a vector3d module
local vector3d = {}

-- Constructor for creating a new vector3d
function vector3d.new(x, y, z)
    local vector = { x = x, y = y, z = z }
    setmetatable(vector, vector3dMetatable)
    return vector
end

-- Function to add two vector3d objects
function vector3d.add(v1, v2)
    return vector3d.new(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
end
vector3dMetatable.__add = vector3d.add -- Bind the add function to the __add metamethod

-- Function to subtract one vector3d from another
function vector3d.sub(v1, v2)
    return vector3d.new(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
end
vector3dMetatable.__sub = vector3d.sub -- Bind the sub function to the __sub metamethod

-- Function to convert a vector3d to a string representation
function vector3d.tostring(v)
    return "(" .. v.x .. ", " .. v.y .. ", " .. v.z .. ")"
end
vector3dMetatable.__tostring = vector3d.tostring -- Bind the tostring function to the __tostring metamethod

-- Create two vector3d instances
local velocity = vector3d.new(10.0, -3.5, 0.0)
local position = vector3d.new(5.0, 5.0, 5.0)

-- Perform vector addition and subtraction
local resultAdd = velocity + position
local resultSub = velocity - position

-- Print the vectors using the custom tostring metamethod
print("Velocity vector: " .. tostring(velocity))
print("Position vector: " .. tostring(position))
print("Position + Velocity: " .. tostring(resultAdd))
print("Position - Velocity: " .. tostring(resultSub))
