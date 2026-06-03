#!/usr/bin/env lua
--
-- Read file line by line
local function readFileLineByLine()
	io.write("Enter file name to read: ")
	local fname = io.read("l")

	if fname and fname ~= "" then
		local file, err = io.open(fname, "r")
		if file then
			file:close()
			for line in io.lines(fname) do
				print("->", line)
			end
		else
			print(string.format("Error opening file [%s]: %s", fname, err))
		end
	else
		print("No filename given.")
	end
end
readFileLineByLine()
