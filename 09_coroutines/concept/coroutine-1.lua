#!/usr/bin/lua

--[[
    myCoroutine function
    A simple coroutine that demonstrates yielding and resuming execution.

    The coroutine prints messages at different stages of its execution:
    - When it starts
    - When it resumes after yielding
    - When it finishes
]]
local function myCoroutine()
	print("Coroutine started")
	coroutine.yield() -- Yield and give up control

	print("Coroutine resumed")
	coroutine.yield() -- Yield again

	print("Coroutine finished")
end

-- Create a coroutine from the myCoroutine function
local co = coroutine.create(myCoroutine)

-- Start the coroutine, which will run until the first yield
coroutine.resume(co) -- Output: "Coroutine started"

-- Resume the coroutine, which will run until the next yield
coroutine.resume(co) -- Output: "Coroutine resumed"

-- Resume the coroutine again, which will run until completion
coroutine.resume(co) -- Output: "Coroutine finished"
