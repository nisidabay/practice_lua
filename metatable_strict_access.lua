#!/usr/bin/env lua

-- Table to store public elements
local treasure = {}

-- Table to store private elements
local privateStorage = {}

-- Metatable to control access to the treasure table
local metatable = {
	-- Function to handle retrieval of elements
	__index = function(_, key)
		if privateStorage[key] then
			print("Retrieving element")
			return privateStorage[key]
		else
			error("Invalid key: " .. key)
		end
	end,
	-- Function to handle addition of new elements
	__newindex = function(_, key, value)
		if privateStorage[key] then
			error("Duplicate key: " .. key)
		else
			privateStorage[key] = value
			print("Adding element")
		end
	end
}

-- Set the metatable for the treasure table
setmetatable(treasure, metatable)

-- Add a new element to the treasure table
treasure.gold = 10

-- Retrieve and print the element from the treasure table
print(treasure.gold)
