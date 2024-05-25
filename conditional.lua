#!/usr/bin/lua
-- Lua script to check voting and drinking eligibility and generate a random number.

-- Function to check voting and drinking eligibility based on age.
-- @param age The age of the person.
-- @param legal_age The legal age for voting and drinking.
-- @return A string indicating eligibility status.
local function checkEligibility(age, legal_age)
    if age >= legal_age then
        return "You can vote and drink"
    else
        return "You cannot vote or drink"
    end
end

-- Set a seed for generating random numbers based on the current time.
math.randomseed(os.time())

-- Generate a random number between 0 and 20.
local random_number = math.random(0, 20)

-- Check eligibility and print the result.
local age = 15
local legal_age = 16
local eligibility_message = checkEligibility(age, legal_age)
print(eligibility_message)

-- Print the generated random number.
print("Random number: " .. random_number)
