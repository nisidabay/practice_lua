# Files & I/O — Reading, Writing, Running Commands

File I/O, io.popen, os.execute, directory operations.

## Quick Start

```bash
lua read_file.lua          # io.open with "r" mode
lua writeToFile.lua        # io.open with "w" mode
lua readAllFile.lua        # Read entire file at once
lua append_to_file.lua     # "a" append mode
lua console_input.lua      # io.read() from stdin
lua os_functions.lua       # os.execute, os.date, os.time
lua lfs_listdir.lua        # Directory listing (lfs required)
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

-- Shell command
local handle = io.popen("ls -la")
local result = handle:read("*a")
handle:close()
```

## Now Build Your Own

Build a directory lister that shows files with their sizes and modification dates.
