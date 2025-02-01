#!/usr/bin/env lua
--
-- Lottery coroutine
--

-- Table to store all generated numbers
local numbers = {}
-- Number of columns (numbers) per bet
local columns = 6

-- Seed the random number generator with the current time
math.randomseed(os.time())

-- Coroutine to generate lottery numbers
local co = coroutine.create(function()
	while true do
		local betNumbers = {} -- Table to store numbers for a single bet
		local seen = {} -- Table to track numbers that have already been generated
		-- Generate unique random numbers for the bet
		while #betNumbers < columns do
			local r = math.random(1, 49)
			if not seen[r] then
				table.insert(betNumbers, r)
				seen[r] = true
			end
		end
		coroutine.yield(betNumbers) -- Yield the current set of numbers
	end
end)

-- Prompt the user to enter the number of bets
print("Enter the number of bets: ")
local bets = tonumber(io.read()) -- Read input and convert to number

-- Check if the input is valid
if not bets or bets <= 0 then
	print("Invalid input. Please enter a positive number.")
	return
end

-- Generate the specified number of bets
for i = 1, bets do
	local status, betNumbers = coroutine.resume(co)
	if status and betNumbers then
		-- Add the generated numbers to the main numbers table
		for _, num in ipairs(betNumbers) do
			table.insert(numbers, num)
		end
		print("Generated bet "..i.. ": ", table.concat(betNumbers, ", "))
	else
		print("Error generating numbers.")
		break
	end
end

-- Function to print all generated bets
local function printNumbers()
	print("All bets:")
	for i, k in ipairs(numbers) do
		io.write(k)
		if i % columns == 0 then
			io.write("\n")
		else
			io.write(", ")
		end
	end
end

-- Print all generated bets
printNumbers()
