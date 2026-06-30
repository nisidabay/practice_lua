# Files & I/O — Reading, Writing, Running Commands

Interact with the filesystem and shell from Lua.

## Structure

```
07_files_io/
├── concept/      # 9 teaching files covering core concepts
├── exercises/    # 6 interactive practice files with TODO sections
├── exercises.lua # Solved reference solutions
└── project/      # Directory lister
```

## How to Use This Group

1. Start with `concept/`: read each file in order
2. Practice with `exercises/`: each file has a `-- TODO` section for your implementation
3. Build the directory lister

## Concepts Covered

- `io.open` for reading (`"r"`), writing (`"w"`), appending (`"a"`)
- `io.lines` and `file:read`
- `io.popen` for shell command output
- `os.execute` for shell commands
- `os.date` and `os.remove`
- `file:seek` for file metadata

## Project

**Directory lister** — displays files in a directory with their sizes and modification dates.

## What's Next

→ [Metatables & OOP](../08_metatables_oop/) — Lua's object system

← [Iterators](../06_iterators/) — review custom iteration
