#!/usr/bin/env lua
--
-- Async file processing
--
-- This script is an example of how to use async file processing with coroutines

-- Function to process each file line by line
local function process_file(filename)
    local file, err = io.open(filename, "r")
    if not file then
        print("Error opening file " .. filename .. ": " .. err)
        return
    end
    for line in file:lines() do
        -- Simulate processing (e.g., searching for a pattern)
        print("Processing line in " .. filename .. ": " .. line)
        coroutine.yield()  -- Yield after processing each line
    end
    file:close()
end

-- List of filenames to process
local filenames = {"log1.txt", "log2.txt", "log3.txt"}
local coroutines = {}

-- Create a coroutine for each file
for _, filename in ipairs(filenames) do
    local co = coroutine.create(function() process_file(filename) end)
    table.insert(coroutines, co)
end

-- Run all coroutines 
while true do
    local all_done = true
    for _, co in ipairs(coroutines) do
        if coroutine.status(co) ~= "dead" then
            all_done = false
            coroutine.resume(co)
        end
    end
    if all_done then break end
end
