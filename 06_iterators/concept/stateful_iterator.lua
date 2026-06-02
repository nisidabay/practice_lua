#!/usr/bin/env lua

-- Array to iterate over
local array = { "Lua", "Tutorial" }

-- Iterator function to iterate over the array
local function iterator(tbl)
	local index = 0
	local count = #tbl
	assert(count > 0, "The array must not be empty.")

	return function()
		index = index + 1
		if index <= count then
			return tbl[index]
		end
	end
end

-- Function to concatenate elements of the array using the iterator
local function concat(tbl)
	local result = {}
	for element in iterator(tbl) do
		table.insert(result, element)
	end
	return table.concat(result, ", ")
end

-- Print each element using the iterator
for element in iterator(array) do
	print(element)
end

-- Print the concatenated string
print(concat(array))
