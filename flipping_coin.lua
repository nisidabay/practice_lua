#!/usr/bin/env lua
--
-- Initialize the random seed
math.randomseed(os.time())

-- Flip a coin
local random = math.random(100)
if random < 50 then
    print("Tails!")
else
    print("Heads!")
end
