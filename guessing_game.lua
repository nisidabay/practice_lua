#!/usr/sbin/lua
--
-- Guessing game

-- Initialize random seed
math.randomseed(os.time())

-- Function to play the guessing game
local function play_guessing_game()
	local number = math.random(1, 100)
	print("Guess a number between 1 and 100")

	while true do
		io.write("Enter your guess: ")
		local input = io.read()
		local guess = tonumber(input)

		if guess then
			if guess == number then
				print("Congratulations! You guessed the number.")
				break
			elseif guess < number then
				print("Too low, try again.")
			else
				print("Too high, try again.")
			end
		else
			print("Invalid input. Please enter a number.")
		end
	end
end

-- Start the game
play_guessing_game()
