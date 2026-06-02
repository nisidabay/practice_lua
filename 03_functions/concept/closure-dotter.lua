#!/usr/bin/lua

-- This script defines a function to create a dot-appending function and
-- includes tests to verify its functionality.

-- Function to create a dot-appending function.
-- @param n [number] The number of dots to append.
-- @return [function] A function that appends n dots to a given string, or nil if n is nil.
function MakeDotter(n)
	local Dots = ""
	if n == nil then
		return nil
	end
	for _ = 1, n do
		Dots = Dots .. "."
	end
	return function(Str)
		return Str .. Dots
	end
end

-- Function to test the MakeDotter function.
-- It verifies that the function correctly appends the specified number of dots to a string.
local function testMakeDotter()
	local dotter3 = MakeDotter(3)
	assert(dotter3("Hi") == "Hi...", "Test case 1 failed: should append 3 dots")

	local dotter0 = MakeDotter(0)
	assert(dotter0("Hello") == "Hello", "Test case 2 failed: should append 0 dots")

	local dotter_nil = MakeDotter()
	assert(dotter_nil == nil, "Test case 3 failed: should return nil when n is nil")
	print("All MakeDotter tests passed!")
end

-- Run the test function to ensure MakeDotter works as expected.
testMakeDotter()
