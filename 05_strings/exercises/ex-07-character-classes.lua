#!/usr/bin/env lua
-- Exercise: Character classes with gmatch
--
-- Instructions: Use string.gmatch with the pattern "%d+%.?%d*" to extract
-- all numbers (integers and decimals) from the data string into the table.

local data = "Temp: 23.5C, Humidity: 67%, Wind: 12km/h"

-- TODO: Use gmatch to extract numbers
local numbers = {}

-- Verification (DO NOT MODIFY)
if #numbers > 0 then
  print("Extracted numbers: " .. table.concat(numbers, ", "))
else
  print("Numbers: (empty)")
end
-- Solution: see exercises.lua
