#!/usr/sbin/lua
--
-- Find the missing numbers in the array

local hash = { 2, 3, 5, 6, 9, 10 }

local missing = {}

-- Set the minimum and maximum values in the hash
local min_val = 1
local max_val = hash[#hash]

-- Create a set for quick lookup of existing numbers
local hash_set = {}
for _, num in ipairs(hash) do
	hash_set[num] = true
end

-- Find missing numbers between min_val and max_val
for num = min_val, max_val do
	if not hash_set[num] then
		table.insert(missing, num)
	end
end

-- Print missing numbers
print("Missing numbers: ")
for _,num in ipairs(missing) do
	print(num)
end
