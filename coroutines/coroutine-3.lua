#!/usr/bin/lua

-- Define a function to get numbers using a coroutine
-- Creating a coroutine inside it using an anonymous function
local function getNumber()
	-- Anonymous function to yield numbers from 1 to 5
	local co = coroutine.create(function()
		for i = 1, 5 do
			coroutine.yield(i)
		end
	end)

	-- Resume the coroutine and store the yielded values in a table
	local yielded_numbers = {}
	while coroutine.status(co) ~= "dead" do
		local _, number = coroutine.resume(co)
		table.insert(yielded_numbers, number)
	end

	return yielded_numbers -- Return the table containing all yielded values
end

-- Loop to call "getNumber" 10 times and print the results
for index = 1, 10 do
	local numbers = getNumber()
	for _, number in ipairs(numbers) do
		print(string.format("index %d: number %d", index, number))
	end
end
