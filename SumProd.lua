#!/usr/sbin/lua
--
-- Write a function that returns both the sum and the product of two numbers
local function SumProd(a, b)
	if not a or not b then
		print("Missing arguments!")
		return
	end
	return a+b, a*b
end

print(SumProd(1,1))
print(SumProd(2,2))
print(SumProd(3,5))
print(SumProd())
print(SumProd(3,3), SumProd(5,5)) --Output 6, 10, 25
