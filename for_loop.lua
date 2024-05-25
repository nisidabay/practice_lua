math.random(os.time())

for count = 1, 100 do
    -- Get random enemy position for a 800x600 resolution
    Enemy_x = math.random(0,800)
    Enemy_y = math.random(0,600)
    print("Enemy at position "..count..": ("..Enemy_x..","..Enemy_y..")")
end


