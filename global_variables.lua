#!/usr/bin/lua
--
-- Declare and access global variables
--

-- Create a table to track declared variables
_G.declared = {}
setmetatable(_G, _G)

-- Define a Declare function
_G.Declare = function(k)
	_G.declared[k] = true
end

-- Set the __index metamethod to prevent reading undeclared variables
_G.__index = function(t, k)
	if not _G.declared[k] then
		error("Can't read undeclared variable: " .. k)
	end
	return rawget(t, k) -- Use rawget to avoid recursion
end

-- Set the __newindex metamethod to prevent writing to undeclared variables
_G.__newindex = function(t, k, v)
	if not _G.declared[k] then
		error("Can't write undeclared variable: " .. k)
	else
		rawset(t, k, v) -- Use rawset to avoid recursion
	end
end

-- Example usage
Declare("X")
Declare("Y")
X = 21
Y = 22
print("X: " .. X .. ", Y: " .. Y)

-- Uncommenting the following lines will cause an error
-- Z = 5 -- Can't add to _G if not declared. This gives error
-- print(Z)

local w = 19 -- Local to the file not in _G
print("Local w: " .. w)
