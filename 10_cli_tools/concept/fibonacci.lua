#!/usr/sbin/lua
--
-- Fibonacci function

local function fib(n)
	if n <= 0 then
		return 0
	elseif n == 1 then
		return 1
	else
		local a, b = 0, 1
		for _ = 2, n do
			a, b = b, a + b
		end
		return b
	end
end

print(fib(15))
