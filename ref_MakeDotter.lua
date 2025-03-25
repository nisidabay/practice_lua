#!/usr/bin/lua
--
-- Function to append dots to a string
local function MakeDotter(n)
	if n == nil then
		return nil
	end

	local dots = string.rep(".", n)

	return function(str)
		return str .. dots
	end
end

local function testMakeDotter()
	local dotter3 = MakeDotter(3)
	assert(dotter3("Hi") == "Hi...", "Test case 1 failed: should append 3 dots")

	local dotter0 = MakeDotter(0)
	assert(dotter0("Hello") == "Hello", "Test case 2 failed: should append 0 dots")

	local dotter_nil = MakeDotter()
	assert(dotter_nil == nil, "Test case 3 failed: should return nil when n is nil")
	print("All MakeDotter tests passed!")
end

testMakeDotter()
