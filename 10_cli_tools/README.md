# CLI Tools — Real Automation

Build real command-line tools: argument parsing, configuration, error handling, and shell integration.

## Structure

```
10_cli_tools/
├── concept/      # 15 teaching files covering core concepts
├── exercises/    # 7 interactive practice files with TODO sections
├── exercises.lua # Solved reference solutions
└── project/      # Book manager (JSON-backed, CLI-driven)
```

## How to Use This Group

1. Start with `concept/`: read each file in order
2. Practice with `exercises/`: each file has a `-- TODO` section for your implementation
3. Build the book manager

## Concepts Covered

- `arg` table for command-line arguments
- `pcall` for protected calls
- `xpcall` with custom error handlers
- Config file parsing with patterns
- Line counting
- `assert` for precondition checks
- `io.popen` for shell integration

## Project

**Book manager** — a full CLI application that stores books in JSON, supporting add, list, search, and mark-as-done commands.

## What's Next

← [Coroutines](../09_coroutines/) — review cooperative multitasking

## Congratulations!

You've completed the **Lua — A Hands-On Scripting Curriculum**! You now have a solid foundation in:

- Variables, control flow, and functions
- Tables, strings, and pattern matching
- Iterators, file I/O, and metatables
- Coroutines and CLI tool building

What's next? Build something real — a Neovim plugin, a Redis script, or a game prototype. Lua is everywhere, and you're ready to use it.
