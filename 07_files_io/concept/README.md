# Files & I/O — Reading, Writing, Running Commands

File I/O, io.popen, os.execute, directory operations.

## Quick Start

```bash
lua read_file.lua               # io.open("r") — read entire file
lua read_file_line_by_line.lua  # io.lines() pattern
lua writeToFile.lua             # io.open("w") — write
lua readAllFile.lua             # Read entire file at once via :read("*a")
lua append_to_file.lua          # "a" append mode
lua console_input.lua           # io.read() from stdin
lua user_input.lua              # Interactive number input
lua os_functions.lua            # os.execute, os.date, os.time
lua lfs_listdir.lua             # Directory listing (lfs required)
```

## Common Patterns

```lua
-- Read entire file
local f = io.open("data.txt", "r")
local content = f:read("*a")
f:close()

-- Write
local f = io.open("out.txt", "w")
f:write("Hello\n")
f:close()

-- Read line by line (no explicit open/close needed)
for line in io.lines("data.txt") do
    print(line)
end

-- Shell command and capture output
local handle = io.popen("ls -la")
local result = handle:read("*a")
handle:close()
```

## Now Build Your Own

Build a directory lister that shows files with their sizes and modification dates.
