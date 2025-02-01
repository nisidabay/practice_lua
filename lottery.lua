#!/usr/sbin/lua
--
-- Lottery script

-- Number of columns (numbers) per bet
local COLUMNS = 6
-- Maximum number for the lottery
local MAX_NUMBER = 49

-- Function to prompt the user for the number of bets
local function getNumberOfBets()
    print("Please enter the number of bets you would like to generate (positive integer): ")
    local bets = tonumber(io.read())
    if not bets or bets <= 0 then
        print("Invalid input. Please enter a positive integer.")
        return nil
    end
    return bets
end

-- Function to generate a set of unique random numbers for a bet
local function generateBetNumbers()
    local betNumbers = {}
    local seen = {}
    while #betNumbers < COLUMNS do
        local r = math.random(1, MAX_NUMBER)
        if not seen[r] then
            table.insert(betNumbers, r)
            seen[r] = true
        end
    end
    return betNumbers
end

-- Main function to generate lottery bets
local function generateLotteryBets()
    local bets = getNumberOfBets()
    if not bets then return end

    for i = 1, bets do
        local betNumbers = generateBetNumbers()
        print("Generated bet " .. i .. ": " .. table.concat(betNumbers, ", "))
    end
end

-- Seed the random number generator
math.randomseed(os.time())

-- Run the lottery bet generator
generateLotteryBets()
