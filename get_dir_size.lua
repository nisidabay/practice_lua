#!/usr/sbin/lua
--
--- Calculates the total size of all files in a given directory.
-- @param directory The path to the directory whose total file size is to be
-- calculated. @return The total size of all files in the directory in bytes, or
-- nil and an error message if an error occurs.

local function get_directory_size(directory)
	local total_size = 0

	-- Open a pipe to execute the find command and get the size of each file
	local p = io.popen('sudo find "' .. directory .. '" -type f -exec du -b {} +')
	if not p then
		return nil, "Failed to open pipe"
	end

	-- Iterate over each line of the command output
	for file in p:lines() do
		if file then
			-- Extract the size from the line and add it to the total size
			local size = tonumber(file:match("^(%d+)"))
			if size then
				total_size = total_size + size
			end
		end
	end
	p:close()

	return total_size
end

-- Usage example
local directory = "/home/nisidabay"
local success, size_or_error = pcall(get_directory_size, directory)
if success then
	-- Print the total size in megabytes
	print(string.format("Total size: %.2f MB", size_or_error / (1024 * 1024)))
else
	-- Print the error message if an error occurred
	print("Error: " .. size_or_error)
end
