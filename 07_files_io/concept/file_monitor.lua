#!/usr/bin/env lua

-- This script monitors a specified directory for changes in files and
-- directories.
-- It uses the LuaFileSystem (lfs) library to track additions, deletions, and
-- modifications.

local lfs = require("lfs")

-- Constants
local MAX_FILES = 1024
local POLL_INTERVAL = 5 -- Poll every 5 seconds

-- Variables to store the previous state of the directory
local prev_files = {}
local prev_file_count = 0

-- Function to send a notification about a file event
-- @param file_name: The name of the file
-- @param message: The message to display
local function notify_action(file_name, message)
    os.execute('notify-send -u normal "Information" "' ..
        file_name .. ' ' .. message .. '" --icon=dialog-information')
end

-- Table of actions to perform on file events
local actions = {
    on_add = function(file_name)
        notify_action(file_name, "has been added.")
    end,
    on_delete = function(file_name)
        notify_action(file_name, "has been deleted.")
    end,
    on_modify = function(file_name)
        notify_action(file_name, "has been modified.")
    end,
}

-- Function to get the current state of the directory
-- @param dir_path: The path of the directory to monitor
-- @return: A table of files and their attributes, and the count of files
local function get_current_state(dir_path)
    local files = {}
    local count = 0

    for file in lfs.dir(dir_path) do
        if file ~= "." and file ~= ".." then
            local path = dir_path .. '/' .. file
            local attr = lfs.attributes(path)
            if attr then
                local file_type = attr.mode == "directory" and "directory" or "file"
                files[count + 1] = { name = file, type = file_type, mtime = attr.modification }
                count = count + 1
            end
        end
        if count >= MAX_FILES then break end
    end

    return files, count
end

-- Function to compare two states and detect changes
-- @param prev: The previous state of the directory
-- @param prev_count: The count of files in the previous state
-- @param curr: The current state of the directory
-- @param curr_count: The count of files in the current state
local function detect_changes(prev, prev_count, curr, curr_count)
    local function is_directory(file)
        return file.type == "directory"
    end

    local function handle_deletion(file)
        if is_directory(file) then
            print("Directory deleted: " .. file.name)
        else
            print("File deleted: " .. file.name)
        end
        actions.on_delete(file.name)
    end

    local function handle_modification(file)
        if is_directory(file) then
            print("Directory modified: " .. file.name)
        else
            print("File modified: " .. file.name)
        end
        actions.on_modify(file.name)
    end

    local function handle_addition(file)
        if is_directory(file) then
            print("New directory added: " .. file.name)
        else
            print("New file added: " .. file.name)
        end
        actions.on_add(file.name)
    end

    -- Check for deleted files or directories
    for i = 1, prev_count do
        local found = false
        for j = 1, curr_count do
            if prev[i] and curr[j] and prev[i].name == curr[j].name then
                found = true
                break
            end
        end
        if not found then
            handle_deletion(prev[i])
        end
    end

    -- Check for new or modified files or directories
    for i = 1, curr_count do
        local found = false
        for j = 1, prev_count do
            if curr[i] and prev[j] and curr[i].name == prev[j].name then
                found = true
                if curr[i].mtime ~= prev[j].mtime then
                    handle_modification(curr[i])
                end
                break
            end
        end
        if not found then
            handle_addition(curr[i])
        end
    end
end

-- Main function to start monitoring the directory
-- @param dir_path: The path of the directory to monitor
local function main(dir_path)
    print("Monitoring directory: " .. dir_path)

    -- Get initial state
    prev_files, prev_file_count = get_current_state(dir_path)
    if prev_file_count == 0 then
        print("Failed to get initial directory state.")
        return
    end

    print("Monitoring directory '" .. dir_path .. "' for changes...")

    while true do
        os.execute("sleep " .. POLL_INTERVAL)

        local curr_files, curr_file_count = get_current_state(dir_path)
        if curr_file_count == 0 then
            print("Failed to get current directory state.")
        else
            -- Detect changes between previous and current state
            detect_changes(prev_files, prev_file_count, curr_files, curr_file_count)

            -- Update previous state to current state
            prev_files, prev_file_count = curr_files, curr_file_count
        end
    end
end

-- Check if directory path is provided
if #arg ~= 1 then
    print("Usage: lua monitor.lua <directory>")
    os.exit(1)
end

main(arg[1])
