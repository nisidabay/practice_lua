#!/usr/sbin/lua
--
-- Function to count the number of lines in a file
-- @param filename: string
-- @return number of lines or error message
local function count_lines_in_file(filename)
    local file, err = io.open(filename, "r")
    if not file then
        return nil, "Error: " .. (err or "File not found or cannot be opened.")
    end

    local line_count = 0
    for _ in file:lines() do
        line_count = line_count + 1
    end
    file:close()

    return line_count
end

-- Define the filename
local filename = os.getenv("HOME") .. "/Downloads/Refactor/practice_lua/automation_scripts/example.txt"

-- Get the line count
local line_count, err = count_lines_in_file(filename)

-- Print the result
if err then
    print(err)
else
    print("Number of lines in file: ", line_count)
end
