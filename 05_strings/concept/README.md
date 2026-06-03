# Strings — Pattern Matching Power

Lua's string library: find, gsub, gmatch, match, format, and patterns.

## Quick Start

```bash
lua string_operations.lua   # Concatenation, length, upper/lower
lua string_find.lua         # string.find with patterns
lua string_gsub.lua         # Global substitution
lua string_gmatch.lua       # Iterate over pattern matches
lua string_match.lua        # Single match extraction
lua string_sub.lua          # Substring extraction
lua string_formatted.lua    # string.format
lua reverse_string.lua      # Manual string reversal
lua find_string.lua         # Case-insensitive find
lua char_byte_rep.lua       # Character code inspection
```

## Common Patterns

```lua
-- Pattern matching
local text = "hello world"
print(text:find("world"))           --> 7  11

-- Substitute (capture %1 in replacement)
print(text:gsub("(%a+)", "%1!"))    --> hello! world!   2

-- Iterate matches
for word in text:gmatch("%a+") do print(word) end

-- Extract with character classes
local ip = "192.168.1.1":match("^(%d+%.%d+%.%d+%.%d+)")

-- Format
print(string.format("Name: %s, Age: %d", "Carlos", 30))
```

## Now Build Your Own

Write a log parser: extract IP addresses, timestamps, and HTTP methods from Apache-style log lines.
