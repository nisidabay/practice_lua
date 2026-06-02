#!/usr/bin/env lua
--
-- Parse arguments in lua
local function parse_arg()
	if #arg ~= 2 then
		return nil, "Usage: lua parse_arguments.lua <filename> [-h|-b]"
	end
	local filename, action = arg[1], arg[2]
	if action ~= "-h" and action ~= "-b" then
		return nil, "Error: Invalid action. Use -h or -b"
	end
	return filename, action
end

local function write_file(filename, action)
	local file, err = io.open(filename, "w")
	if not file then
		return nil, "Error opening input file: " .. tostring(err)
	end
	if action == "-h" then
		file:write("Hello from Lua")
	elseif action == "-b" then
		file:write("Bye from Lua")
	end
	file:close()
	return true
end

local function main()
	local filename, action = parse_arg()
	if not filename then
		io.stderr:write(action .. "\n")
		os.exit(1)
	end

	local ok, err = write_file(filename, action)
	if not ok then
		io.stderr:write(err .. "\n")
		os.exit(1)
	end
end
main()
