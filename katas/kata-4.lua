#!/usr/bin/env lua
-- In this Kata, you be given an array and your task is to return the elements
-- whose value is exceeded by two or more elements in the array.
--
-- For example, solve({1,-2,2,3,4}) = 3, because only {1,-2,2} have at at least
-- two elements that are greater then them. 1 is smaller than 2,3,4. Similarly,
-- -2 is the smallest and is exceed by all other elements, and 2 is smaller than
-- 3 and 4. There are a number of ways to solve this. One way is to run two
-- loops and check if an element occurs at least twice and store it in an array.

local values = { 1, -2, 2, 3, 4 }

local result = {}

-- Iterate over each element in the values array
for i = 1, #values do
	local count = 0
	-- Compare the current element with every other element
	for j = 1, #values do
		if values[j] > values[i] then
			count = count + 1
		end
	end
	-- If the current element is exceeded by two or more elements, add it to the result
	if count >= 2 then
		table.insert(result, values[i])
	end
end

-- Function to print the results
local function print_results()
    if #result == 0 then
        print()
        return
    end
    print(table.concat(result, ", "))
end

-- Print the results
print_results()
