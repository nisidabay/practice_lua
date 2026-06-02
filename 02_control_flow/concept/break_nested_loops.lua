#!/usr/bin/env lua
--
-- Break nested loops

for i = 1, 5 do
	for j = 1, 5 do
		if i == 3 and j == 3 then
			print("Breaking out of both loops")
			goto leaving
		end
		print("Iteration: ", i, j)
	end
end

::leaving::
