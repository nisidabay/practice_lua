#!/usr/bin/env lua
--
-- While loop example

math.random(os.time())

local player_x, player_y = 400, 300
local enemies_counter = 0
local wanted_enemies = 500

while enemies_counter < wanted_enemies do
	-- Get random enemy position for a 800x600 resolution
	local enemy_x = math.random(0, 800)
	local enemy_y = math.random(0, 600)
	if player_x == enemy_x and player_y == enemy_y then
		print("Enemy position and player position collide!")
	else
		print("Enemy " .. enemies_counter .. ": (" .. enemy_x .. "," .. enemy_y .. ")")
		enemies_counter = enemies_counter + 1
	end
end
print("All done. Set: " .. enemies_counter .. " enemies")
