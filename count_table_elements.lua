#!/usr/bin/env lua
---
-- Counting elements in a Lua table using ipairs, pairs, and a custom iterator.
-- @module count_table_elements

-- Counts elements in a table using ipairs.
-- Iterates over the table using ipairs, which stops at the first nil value.
-- @param t table The table to count elements from.
-- @return number The count of elements until the first nil value.
local function countWithIpairs(t)
	local count = 0
	for _, _ in ipairs(t) do
		count = count + 1
	end
	return count
end

-- Counts elements in a table using pairs.
-- Iterates over the table using pairs, which does not stop at nil values.
-- @param t table The table to count elements from.
-- @return number The count of all elements in the table.
local function countWithPairs(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

-- Counts all elements in a table from 1 to the length of the table.
-- Iterates over the table using a numeric for loop up to the length of the table.
-- @param t table The table to count elements from.
-- @return number The count of all elements from 1 to the length of the table.
local function countAll(t)
	local count = 0
	for _ = 1, #t do
		count = count + 1
	end
	return count
end

-- Sample table with some elements and a nil value
local colors = { "red", "green", nil, "blue", "yellow" }

-- Print counts using ipairs, pairs, and the custom countAll function to demonstrate the differences
print("Count with ipairs: " .. countWithIpairs(colors)) -- Output: 2
print("Count with pairs: " .. countWithPairs(colors)) -- Output: 5
print("Count with All: " .. countAll(colors)) -- Output: 5
