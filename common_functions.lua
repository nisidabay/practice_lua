#!/usr/bin/lua
-- Popular OS functions
--
local current_date = os.date()
print(current_date)

local time_diff = os.difftime(os.time(), os.time() - 3600)
print(time_diff)

local temp_file= os.mktmpname("temp")
local success = os.remove("example.txt")

local rename_success = os.rename("old.txt", "new.txt")

local current_time = os.time()
os.exit()

local floor_result = math.floor(3.14)

local ceil_result = math.ceil(3.14)

local random_num = math.random(1, 100)
math.randomseed(os.time())
