#!/usr/bin/env lua
--
-- While loop example

math.random(os.time())

local player_position_x, player_position_y = 400, 300
local enemy_count = 0
local target_enemy_count = 500

while enemy_count < target_enemy_count do
	-- Get random enemy position for a 800x600 resolution
	local enemy_position_x = math.random(0, 800)
	local enemy_position_y = math.random(0, 600)
	if player_position_x == enemy_position_x and player_position_y == enemy_position_y then
		print("Enemy position and player position collide!")
	else
		output_message = string.format("Enemy: {%d}, Enemy position: {%d},{%d}\n", enemy_count, enemy_position_x, enemy_position_y)
		print(output_message)
		enemy_count = enemy_count + 1
	end
end
print("All done. Set: " .. enemy_count .. " enemies")
