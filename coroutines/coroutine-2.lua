#!/usr/bin/lua
--
-- Coroutine demonstration example
-- Shows how to create, yield, and resume coroutines in Lua

-- Configuration
local COUNT_FIRST_COROUTINE = 10
local COUNT_SECOND_COROUTINE = 10
local YIELD_AT = 5
local START_SECOND_COROUTINE = 11

-- Function to create a coroutine that prints numbers within a range
local function create_number_coroutine(prefix, start, count, yield_at)
	return coroutine.create(function()
		for i = start, start + count - 1 do
			print(string.format("%s%d", prefix, i))
			if yield_at and i == yield_at then
				coroutine.yield() -- Yield control at specified point
			end
		end
	end)
end

-- Function to resume a coroutine and handle errors
local function resume_coroutine(co, name)
	local status, err = coroutine.resume(co)
	if not status then
		print(string.format("Error resuming %s: %s", name, err))
	end
	print(string.format("Status of %s: %s", name, coroutine.status(co)))
end

-- Create coroutines with appropriate parameters
local coroutine_1 = create_number_coroutine("Inside coroutine 1: ", 1, COUNT_FIRST_COROUTINE, YIELD_AT)

local coroutine_2 = create_number_coroutine("Inside coroutine 2: ", START_SECOND_COROUTINE, COUNT_SECOND_COROUTINE)

-- Main execution - resume coroutines and print their status
print("--- Starting first coroutine execution ---")
resume_coroutine(coroutine_1, "coroutine_1")

print("\n--- Starting second coroutine execution ---")
resume_coroutine(coroutine_2, "coroutine_2")

print("\n--- Resuming first coroutine ---")
resume_coroutine(coroutine_1, "coroutine_1")
