#!/usr/bin/env lua
--
-- Use coroutine to redlines in a file
local function lines(filename)
	local co = coroutine.wrap(function()
		local f = assert(io.open(filename, "r"), "File not found")
		for line in f:lines("l") do
			coroutine.yield(line)
		end
		f:close()
	end)
	return co -- calling co() gives next line or nil
end

-- === USE IT ===
io.write("Enter file name to read: ")
local fname = io.read("l")
if fname and fname ~= "" then
	for line in lines(fname) do
		print("→", line)
	end
else
	print("No filename given.")
end
