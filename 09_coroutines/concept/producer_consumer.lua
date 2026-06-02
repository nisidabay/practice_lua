#!/usr/bin/lua
--
-- Producer-Consumer example using coroutines

-- Define a producer coroutine function
local function producer()
	local item = 0
	for _ = 1, 10 do
		item = item + 1
		print("Produced item " .. item)
		coroutine.yield(item) -- Yield control and pass the produced item
	end
end

-- Define a consumer coroutine function
local function consumer(prod)
	while true do
		local status, item = coroutine.resume(prod) -- Resume producer to get an item
		if status and item then
			print("Consumer gets item " .. item)
		else
			print("Consumer has finished")
			break
		end
	end
end

-- Create the producer coroutine
local prod = coroutine.create(producer)

-- Start the consumer coroutine
consumer(prod)
