#!/usr/bin/env lua

-- This script manages wallpaper settings, including selecting, setting, and
-- updating wallpapers. It also updates related resources and sends
-- notifications upon changes.

-- Path of the current wallpaper in use
local cache_file = os.getenv("HOME") .. "/.cache/current_wallpaper"
-- Path of the current wallpaper in use with rofi syntax
local rasi_file = os.getenv("HOME") .. "/.config/rofi/current_wallpaper.rasi"
-- Computer name
local uname = io.popen("uname"):read("*l")
-- Get the WALLPAPER_DIR based on the computer name
local WALLPAPER_DIR = (uname == "msi") and "/mnt/sata/Pictures/wallpaper" or os.getenv("HOME") .. "/Pictures/wallpaper"

-- Execute command passed as argument 
-- @param cmd: any
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function execute_command(cmd)
    local success, _, code = os.execute(cmd)
    if not success or code ~= 0 then
        return false, "Command failed: " .. cmd
    end
    return true
end

-- Ensures the wallpaper directory contains image files
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function ensure_wallpaper_directory()
    local handle = io.popen('find "' .. WALLPAPER_DIR .. '" -type f \\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \\)')
    if not handle then
        return false, "Failed to execute find command"
    end
    local result = handle:read("*a")
    handle:close()

    if result == "" then
        return false, WALLPAPER_DIR .. " is empty"
    end
    return true
end

-- Create a file in the specified path if it doesn't exist
-- @param file_path: string
-- @param content: string
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function create_file_if_missing(file_path, content)
    local file = io.open(file_path, "r")
    if not file then
        file = io.open(file_path, "w")
        if not file then
            return false, "Failed to create file: " .. file_path
        end
        file:write(content)
        file:close()
    else
        file:close()
    end
    return true
end

-- Create cache and rasi files if they do not exist
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function create_cache_and_rasi_files()
    local success, err = create_file_if_missing(cache_file, WALLPAPER_DIR .. "/current_bg_image.png")
    if not success then return false, err end

    success, err = create_file_if_missing(rasi_file, '* { current-image: url("' .. WALLPAPER_DIR .. '/current_bg_image.png", height); }')
    if not success then return false, err end

    return true
end

-- Set the wallpaper using external commands
-- @param wallpaper_path: string
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function set_wallpaper(wallpaper_path)
    local success, err = execute_command('wal -q -i "' .. wallpaper_path .. '"')
    if not success then return false, err end

    success, err = execute_command('feh --bg-scale "' .. wallpaper_path .. '"')
    if not success then return false, err end

    return true
end

-- Update system resources related to the wallpaper
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function update_resources()
    local success, err = execute_command('source "' .. os.getenv("HOME") .. '/bin/update_xresources.sh"')
    if not success then return false, err end

    success, err = execute_command('source "' .. os.getenv("HOME") .. '/.cache/wal/colors.sh"')
    if not success then return false, err end

    return true
end

-- Write the current wallpaper path to cache and rasi files
-- @param wallpaper_path: string
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function write_cache_and_rasi(wallpaper_path)
    local cache = io.open(cache_file, "w")
    if not cache then
        return false, "Failed to open cache file for writing"
    end
    cache:write(wallpaper_path)
    cache:close()

    local rasi = io.open(rasi_file, "w")
    if not rasi then
        return false, "Failed to open rasi file for writing"
    end
    rasi:write('* { current-image: url("' .. wallpaper_path .. '", height); }')
    rasi:close()

    return true
end

-- Create a symbolic link to the current wallpaper
-- @param wallpaper_path: string
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function create_symlink(wallpaper_path)
    local success, err = execute_command('ln -sf "' .. wallpaper_path .. '" "' .. WALLPAPER_DIR .. '/current_bg_image.png"')
    if not success then return false, err end

    return true
end

-- Send a notification about the wallpaper update
-- @param wallpaper_path: string
-- @return (boolean, string) true if command succeed otherwise false and an error message
local function send_notification(wallpaper_path)
    local success, err = execute_command('notify-send "Colors and Wallpaper updated" "with image ' .. wallpaper_path .. '"')
    if not success then return false, err end

    print("Done.")
    return true
end

-- Main function to manage wallpaper setting process
-- @param arg: table of command line arguments
local function main(arg)
    local success, err = ensure_wallpaper_directory()
    if not success then
        print(err)
        os.exit(1)
    end

    success, err = create_cache_and_rasi_files()
    if not success then
        print(err)
        os.exit(1)
    end

    local cache = io.open(cache_file)
    if not cache then
        print("Failed to open cache file")
        os.exit(1)
    end
    local current_wallpaper = cache:read("*l")
    cache:close()

    if not current_wallpaper then
        print("Failed to read current wallpaper from cache")
        os.exit(1)
    end

    local wallpaper_path
    if arg[1] == "init" then
        wallpaper_path = current_wallpaper
    elseif arg[1] == "random" then
        local handle = io.popen(
            'find "'
                .. WALLPAPER_DIR
                .. '" -type f \\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \\) -exec basename {} \\; | sort -R | rofi -dmenu -i -p "Select Wallpaper"'
        )
        if not handle then
            print("Failed to execute wallpaper selection command")
            os.exit(1)
        end
        local selected = handle:read("*l")
        handle:close()

        if not selected or selected == "" then
            print("No wallpaper selected")
            os.exit(1)
        end

        wallpaper_path = WALLPAPER_DIR .. "/" .. selected
    else
        local handle = io.popen(
            'find "'
                .. WALLPAPER_DIR
                .. '" -type f \\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \\) | shuf -n 1'
        )
        if not handle then
            print("Failed to execute random wallpaper command")
            os.exit(1)
        end
        wallpaper_path = handle:read("*l")
        handle:close()

        if not wallpaper_path then
            print("No wallpaper found")
            os.exit(1)
        end
    end

    success, err = set_wallpaper(wallpaper_path)
    if not success then
        print(err)
        os.exit(1)
    end

    success, err = update_resources()
    if not success then
        print(err)
        os.exit(1)
    end

    success, err = write_cache_and_rasi(wallpaper_path)
    if not success then
        print(err)
        os.exit(1)
    end

    success, err = create_symlink(wallpaper_path)
    if not success then
        print(err)
        os.exit(1)
    end

    success, err = send_notification(wallpaper_path)
    if not success then
        print(err)
        os.exit(1)
    end
end

main(arg)
