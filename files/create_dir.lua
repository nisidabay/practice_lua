#!/usr/bin/env lua
--
-- Create directory
local lfs = require("lfs")
local newDir = "test_dir"

local success, err = lfs.mkdir(newDir)
if success then
	print("Directory created: ", newDir)
else
	print("Error creating director:", err)
end
