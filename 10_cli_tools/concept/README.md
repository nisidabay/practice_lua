# CLI Tools — Real Automation

Argument parsing, config files, JSON, error handling, and shell integration.

## Quick Start

```bash
lua parse_arguments.lua         # Parse command-line args
lua getting_config.lua          # Read .conf files
lua count_numbers_of_lines.lua  # WC-style line counter
lua string_replace.lua          # Sed-style string replacement
lua set_wallpaper.lua           # Full system tool (wallpaper setter)
lua pcall_example.lua           # Protected calls for error handling
lua xpcall_example.lua          # xpcall with error handler
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
```

## Now Build Your Own

Build a CLI note-taker: `lua notes.lua add "Buy milk"` stores notes in a JSON file, `lua notes.lua list` shows them, `lua notes.lua done 2` marks a note complete.
