#!/usr/bin/env lua
--
-- This script lists all files and directories in a specified directory.
-- It uses the LuaFileSystem (lfs) library to access file system attributes.

local lfs = require("lfs")

-- Function to iterate over files and directories in the given directory path.
-- @param dir_path: The path of the directory to list contents from.
local function get_files(dir_path)
    for file in lfs.dir(dir_path) do
        local attrs = lfs.attributes(file)
        if attrs and attrs.mode == "file" then
            print("File: " .. file)
        else
            print("Directory: " .. file)
        end
    end
end

-- Main function to execute the script logic.
-- @param dir_path: The path of the directory to process.
local function main(dir_path)
    get_files(dir_path)
end

-- Check if the correct number of arguments is provided.
-- If not, print usage instructions and exit.
if #arg ~= 1 then
    print("Usage: lfs_listdir.lua <directory>")
    os.exit(1)
else
    main(arg[1])
end
