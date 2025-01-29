math.random(os.time())

for count = 1, 100 do
    -- Get random enemy position for a 800x600 resolution
    enemy_x = math.random(0,800)
    enemy_y = math.random(0,600)
    print("Enemy at position "..count..": ("..enemy_x..","..enemy_y..")")
end


