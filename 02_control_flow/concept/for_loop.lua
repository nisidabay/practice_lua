#!/usr/bin/env lua
--
-- Generate random numbers

math.random(os.time())

for count = 1, 100 do
	local enemy_x = math.random(0, 800)
	local enemy_y = math.random(0, 600)
	print("Enemy at position " .. count .. ": (" .. enemy_x .. "," .. enemy_y .. ")")
end
