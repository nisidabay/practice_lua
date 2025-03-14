#!/usr/bin/env lua
--
-- This script provides functions to convert a string to its byte representation
-- and back to a string from its byte representation. It also includes functions
-- to get user input and print the byte representation of the input string.
--

-- Table to store the byte representation of the original string
local byteRepresentation = {}

-- Function to convert a string to a byte array
-- @param inputString: The input string to be converted
local function convertStringToByteArray(inputString)
    for i = 1, #inputString do
        byteRepresentation[i] = string.byte(inputString, i)
    end
end

-- Function to convert a byte array back to a string
-- @return: The decoded string from the byte array
local function convertByteArrayToString()
    local decodedString = {}
    for index, byteValue in pairs(byteRepresentation) do
        decodedString[index] = string.char(byteValue)
        print("Decoding " .. byteValue .. " to: " .. decodedString[index])
    end
    print("Original string: " .. table.concat(decodedString))
end

-- Function to get user input from the console
-- Prompts the user to enter a string and converts it to a byte array
local function getUserInput()
    io.write("Enter a string: ")
    local userInput = io.read("*l")
    if userInput then
        convertStringToByteArray(userInput)
    end
end

-- Function to print the byte representation of the original string
local function printByteRepresentation()
    local byteArray = {}
    for _, byteValue in pairs(byteRepresentation) do
        table.insert(byteArray, byteValue)
    end
    print("Encoding string: " .. table.concat(byteArray, ' '))
end

-- Main execution starts here
-- Get user input, print the byte representation, and decode it back to a string
getUserInput()
printByteRepresentation()
convertByteArrayToString()
