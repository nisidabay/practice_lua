#!/usr/bin/env lua
--
-- Guess user number Constants
local INITIAL_BALANCE = 1000

-- Function to get the user's guess
local function get_user_guess()
	local guess = 0
	io.write("Guess a number between 1 and 6. (0 exit the game:) ")
	guess = io.read()
	if guess == 0 then
		print("Exiting game...")
	end
	return tonumber(guess)
end

-- Function to get the user's bet
local function get_user_bet(balance)
	local bet = 0
	print("Your current balance is: " .. balance)
	io.write("Enter the amount you want to bet: ")
	bet = io.read()
	return tonumber(bet)
end

-- Function to roll the dice
local function roll_dice()
	return math.random(1, 6)
end

-- Main function
local function main()
	-- Seed the random number generator
	math.randomseed(os.time())

	local balance = INITIAL_BALANCE
	local bet = 0

	while balance > 0 do
		bet = get_user_bet(balance)
		if bet > balance then
			print("You don't have enough money to place that bet.")
			goto continue
		end

		-- Sleep for 1 second (using os.execute, similar to sleep() in C)
		os.execute("sleep 1")

		local guess = get_user_guess()
		if guess == 0 then
			break
		end

		if guess < 1 or guess > 6 then
			print("Invalid guess. Please enter a number between 1 and 6.")
			goto continue
		end

		local dice = roll_dice()
		print("Dice rolled: " .. dice .. ", Your guess: " .. guess)

		if guess == dice then
			bet = bet * 3
			balance = balance + bet
			print("Congratulations! You guessed correctly!")
			print("Increasing your balance by " .. bet)
		else
			print("Sorry, you guessed wrong.")
			print("Deducting the bet from your balance.")
			balance = balance - bet
		end

		if balance <= 0 then
			print("Game over! You have no money left.")
		end

		::continue::
	end
end

-- Run the main function
main()
