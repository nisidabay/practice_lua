# CLI Tools — Real Automation

Argument parsing, config files, error handling, and shell integration.

## Quick Start

```bash
lua parse_arguments.lua          # Parse command-line args
lua getting_config.lua           # Read .conf files
lua count_numbers_of_lines.lua   # WC-style line counter
lua string_replace.lua           # Sed-style string replacement
lua set_wallpaper.lua            # Full system tool (wallpaper setter)
lua smart-df.lua                 # Disk-free with human-readable output
lua dir_lister.lua               # Directory listing tool
lua book_management.lua          # JSON-backed book manager
lua pcall_example.lua            # Protected calls for error handling
lua pcall_assert.lua             # Combining pcall and assert
lua xpcall_example.lua           # xpcall with error handler
lua custom_errors.lua            # Custom error types
lua customErrorHandler.lua       # Custom error handler function
lua assert-1.lua                 # assert basics
lua assert-2.lua                 # assert with messages
```

## Common Patterns

```lua
-- Arg parsing
local arg = {...}
if arg[1] == "--help" then
    print("Usage: script.lua [options]")
    return
end

-- Config file
for line in io.lines("config.conf") do
    local key, val = line:match("^(%w+)%s*=%s*(.+)$")
    if key then config[key] = val end
end

-- Protected call
local ok, err = pcall(function()
    error("something went wrong")
end)
if not ok then print("Caught:", err) end

-- xpcall with stack trace
local function handler(err)
    return debug.traceback("ERROR: " .. tostring(err), 2)
end
xpcall(risky_function, handler)
```

## Now Build Your Own

Build a CLI note-taker: `lua notes.lua add "Buy milk"` stores notes in JSON, `list` shows them, `done 2` marks complete.
