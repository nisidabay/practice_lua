#!/usr/bin/lua
--
-- Popular os functions
--

-- Print the current date
local current_date = os.date()
print("Current date: " .. current_date)

-- Calculate the time difference of one hour
local time_diff = os.difftime(os.time(), os.time() - 3600)
print("Time difference (1 hour): " .. time_diff .. " seconds")

-- Create a temporary file and remove it
local temp_file = os.tmpname()
print("Temporary file created: " .. temp_file)
os.remove(temp_file)
print("Temporary file removed")

-- Rename a file
local old_name = "old.txt"
local new_name = "new.txt"
local rename_success = os.rename(old_name, new_name)
if rename_success then
    print("File renamed from " .. old_name .. " to " .. new_name)
else
    print("Failed to rename file " .. old_name)
end

-- Print the current time
local current_time = os.time()
print("Current time (seconds since epoch): " .. current_time)

-- Perform some math operations
print("Floor of 3.14: " .. math.floor(3.14))
print("Ceiling of 3.14: " .. math.ceil(3.14))

-- Generate a random number
math.randomseed(os.time())
local random_num = math.random(1, 100)
print("Random number between 1 and 100: " .. random_num)

-- Get CPU time used by the program
local cpu_time = os.clock()
print("CPU time used: " .. cpu_time .. " seconds")

-- Get an environment variable
local path = os.getenv("PATH")
print("PATH environment variable: " .. (path or "Not found"))

-- Set and get locale
local current_locale = os.setlocale(nil) -- Get current locale
print("Current locale: " .. current_locale)
os.setlocale("C") -- Set locale to "C"
print("Locale set to 'C'")

-- Execute a shell command
local command_success = os.execute("echo 'Hello from shell'")
if command_success then
    print("Shell command executed successfully")
else
    print("Shell command execution failed")
end

-- Exit the script with a status code
os.exit(0)
