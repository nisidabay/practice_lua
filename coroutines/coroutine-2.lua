#!/usr/bin/lua
--
-- Define  a coroutine named 'coroutine_1' using an anonymous function
local coroutine_1 = coroutine.create(function()
	for i = 1, 10 do
		print("coroutine 1 " .. i)
		if i == 5 then
			coroutine.yield() -- Yield and give up control at i == 5
		end
	end
end)

-- Define a function named 'coroutine_func'
local coroutine_func = function()
	for i = 11, 20 do
		print("coroutine 2 " .. i)
	end
end

-- Create another coroutine named 'coroutine_2' from the 'coroutine_func'
-- function
local coroutine_2 = coroutine.create(coroutine_func)

-- Start 'coroutine_1'
coroutine.resume(coroutine_1)

-- Check the status of 'coroutine_1' (it will be 'suspended' due to yielding)
print(coroutine.status(coroutine_1))

-- Start 'coroutine_2'
coroutine.resume(coroutine_2)

-- Check the status of 'coroutine_2' (it will be 'dead' as it finishes)
print(coroutine.status(coroutine_2))

-- Check the status of 'routine_1' again (it will be 'suspended' again)
print(coroutine.status(coroutine_1))

-- Resume 'routine_1' again (it continues from where it yielded)
coroutine.resume(coroutine_1)
