#!/usr/bin/lua
-- Define a coroutine function
local function myCoroutine()
	print("Coroutine started")
	coroutine.yield() -- Yield and give up control

	print("Coroutine resumed")
	coroutine.yield()

	print("Coroutine finished")
end

-- Create a coroutine
local co = coroutine.create(myCoroutine)

-- Start the coroutine
coroutine.resume(co) -- Output: "Coroutine started"

-- Resume the coroutine
coroutine.resume(co) -- Output: "Coroutine resumed"

-- Resume the coroutine again
coroutine.resume(co) -- Output: "Coroutine finished"
