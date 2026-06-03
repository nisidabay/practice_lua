#!/usr/bin/env lua
-- guessing_game.lua -- Guess the number between 1 and 100.
math.randomseed(os.time())
local secret = math.random(1, 100)
local guess, attempts = nil, 0

print("Guess the number (1-100)!")

while guess ~= secret do
    io.write("Your guess: ")
    guess = tonumber(io.read())
    attempts = attempts + 1
    if guess < secret then print("Too low!")
    elseif guess > secret then print("Too high!")
    end
end

print(string.format("Correct! It took %d attempts.", attempts))
