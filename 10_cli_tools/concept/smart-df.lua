#!/usr/bin/env lua

-- Execute a command
local function run(cmd)
	local f = io.popen(cmd)
	if not f then
		error("Failed to run: " .. cmd)
	end
	local output = f:read("*a")
	local success, exit_code = f:close()
	if not success then
		error("Command failed: " .. cmd .. " (exit code: " .. tostring(exit_code) .. ")")
	end
	return output
end

-- Use df -P: guaranteed 6 columns, mount point is last field
local df_out = run("df -P")
local lines = {}
for line in df_out:gmatch("[^\r\n]+") do
	table.insert(lines, line)
end

if #lines < 2 then
	print("No data from df")
	os.exit(1)
end

-- Print header
print("Filesystem          Size       Used       Avail      Use%     Mounted on")

-- Process data lines (skip header)
for i = 2, #lines do
	local line = lines[i]
	if line:match("^%s*$") then
		goto continue
	end

	-- df -P format: first 4 fields are single words, 5th is %, rest is mount
	-- We can split first 5 fields by whitespace, then take the rest as mount
	local fields = {}
	local pos = 1
	local function nextField()
		-- Skip leading spaces
		while pos <= #line and line:sub(pos, pos) == " " do
			pos = pos + 1
		end
		if pos > #line then
			return nil
		end
		local start = pos
		while pos <= #line and line:sub(pos, pos) ~= " " do
			pos = pos + 1
		end
		return line:sub(start, pos - 1)
	end

	local fs = nextField()
	local size = nextField()
	local used = nextField()
	local avail = nextField()
	local pct = nextField()
	if not (fs and size and used and avail and pct) then
		goto continue
	end

	-- The rest of the line is the mount point (may contain spaces)
	while pos <= #line and line:sub(pos, pos) == " " do
		pos = pos + 1
	end
	local mount = line:sub(pos)

	if mount == "" then
		mount = "/"
	end

	-- Skip tmpfs
	if fs:match("tmpfs") or fs:match("devtmpfs") then
		goto continue
	end

	-- Parse usage
	local usage = tonumber(pct:match("(%d+)%%"))
	local color = ""
	local reset = ""
	if usage and usage > 80 then
		color = "\27[31m"
		reset = "\27[0m"
	end

	-- Format with fixed widths
	print(string.format("%-19s %-10s %-10s %-10s %s%-8s%s %s", fs, size, used, avail, color, pct, reset, mount))
	::continue::
end
