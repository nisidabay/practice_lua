#!/usr/sbin/lua
--
-- Create fibonacci metatable
local fib_mt = {
	__index = function(self, key)
		if key < 2 then
			return 1
		end
		self[key] = self[key - 2] + self[key - 1]
		print("key is: " .. key)
		return self[key]
	end,
}

local fib = setmetatable({}, fib_mt)
print(fib[5]) -- This will print the 5th Fibonacci number
