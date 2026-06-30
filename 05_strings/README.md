# Strings — Pattern Matching Power

Lua's compact but powerful string library: find, replace, match, and format.

## Structure

```
05_strings/
├── concept/      # 12 teaching files covering core concepts
├── exercises/    # 8 interactive practice files with TODO sections
├── exercises.lua # Solved reference solutions
└── project/      # Log file parser
```

## How to Use This Group

1. Start with `concept/`: read each file in order
2. Practice with `exercises/`: each file has a `-- TODO` section for your implementation
3. Build the log file parser

## Concepts Covered

- Concatenation and length (`#`)
- `string.find` with pattern matching
- `string.sub` for substrings
- `string.gsub` with captures
- `string.gmatch` and `string.match`
- `string.format`
- Character classes (`%d`, `%a`, `%w`, etc.)

## Project

**Log file parser** — extract IP addresses, timestamps, HTTP methods, and status codes from Apache-style log lines.

## What's Next

→ [Iterators](../06_iterators/) — custom iteration with pairs, ipairs, and closures

← [Tables](../04_tables/) — review table operations
