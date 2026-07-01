#!/usr/bin/env lua
-- Exercise: Insert and remove — Add and remove elements from fruits
--
-- Create a fruits table, then insert "date" at the end and "blueberry"
-- at position 2. Finally remove the element at position 2.

-- TODO: fill in the table.insert and table.remove calls
local fruits = {"apple", "banana", "cherry"}

-- Add "date" at the end
-- Add "blueberry" at position 2
print("After insert:", table.concat(fruits, ", "))

-- Remove the element at position 2
print("After remove pos 2:", table.concat(fruits, ", "))

-- Expected: After insert: apple, blueberry, banana, cherry, date
-- Expected: After remove pos 2: apple, banana, cherry, date
-- Solution: see exercises.lua
