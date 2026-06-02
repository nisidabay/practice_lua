#!/usr/bin/env lua

-- Function to count lines in a file
local function count_lines_in_file(filename)
	-- Open the file in read mode
	local file, err = io.open(filename, "r")

	-- Check for errors
	if not file then
		return nil, "Error: " .. (err or "File not found or cannot be opened")
	end

	-- Initialize line counter
	local line_count = 0

	-- Iterate through lines and count them
	for _ in file:lines() do
		line_count = line_count + 1
	end

	-- Close the file
	file:close()

	-- Return line count as a result
	return line_count, nil
end

-- Entry point
local function main()
	io.write("Enter filename: ")
	local filename = io.read()

	-- Call the function to get the line count
	local line_count, err = count_lines_in_file(filename)

	-- Handle errors
	if err then
		print(err)
	else
		-- Print the result
		local total_lines = string.format("Number of lines in file: %d", line_count)
		print(total_lines)
	end
end
main()
