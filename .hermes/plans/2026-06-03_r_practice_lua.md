# r_practice_lua — Transformation Plan

**Goal**: Restructure the flat 23-directory `~/r_practice_lua/` into a numbered, progressive Lua curriculum following the same `concept/README.md + exercises.lua + project/` model as r_pyqt_practice and r_ruby_practice.

**Date**: 2026-06-03

---

## Honest Assessment of What's Here

### The Good
- **~130 Lua files**, real code Carlos wrote
- **Real projects**: `book_management` (269-line CLI CRUD app with JSON), `set_wallpaper` (241-line system tool with rofi/feh/wal integration)
- **Deep metatable coverage** (26 files) — best-resourced topic
- **Coroutines** (12 files) — pipeline, scheduler, producer-consumer
- **Strong CLI automation**: config reading, directory listing, string replacement

### The Problems
- **Flat dump**: 23 directories, no numbering, no progression
- **No README anywhere**: impossible for a stranger to navigate
- **Duplicates**: `bit_operations/` and `bits_operations/` overlap
- **Third-party code**: `debugger.lua` (669 lines, Scott Lembcke, MIT) — not teaching material
- **LLM output**: `metatables-llama.md` — not curriculum
- **Redundancy**: `examples/` (9 files) and `reference_impl/` (5 files) overlap with topic directories
- **No exercises**: all runnable demos, no "you write the code" practice
- **Mixed quality**: `examples/basic.lua` (28 lines, variables+arithmetic) alongside `coroutines/task_scheduler.lua` (complex)

---

## Target Structure (10 Groups)

```
~/r_practice_lua/
├── README.md
├── .gitignore
├── 01_basics/
│   ├── concept/          # Variables, types, arithmetic, print
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Simple calculator
├── 02_control_flow/
│   ├── concept/          # if/else, while, for, repeat, goto, break
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Guessing game
├── 03_functions/
│   ├── concept/          # Functions, args, returns, varargs, tail calls
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Math utility library
├── 04_tables/
│   ├── concept/          # Tables as arrays, dicts, nested, sorting
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Contact list
├── 05_strings/
│   ├── concept/          # String methods, patterns, gsub, gmatch
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Log parser
├── 06_iterators/
│   ├── concept/          # pairs/ipairs, stateless, stateful, custom
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Range iterator library
├── 07_files_io/
│   ├── concept/          # File read/write, io.popen, os.execute, dirs
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Directory lister
├── 08_metatables_oop/
│   ├── concept/          # __index, __newindex, __add, __tostring, OOP
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Vector3D class
├── 09_coroutines/
│   ├── concept/          # create/resume/yield, pipelines, schedulers
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Task scheduler
├── 10_cli_tools/
│   ├── concept/          # arg parsing, config files, shell integration
│   │   └── README.md
│   ├── exercises.lua
│   └── project/          # Book management (from existing)
```

## Source Mapping (Old → New)

| Old Directory | Moves To | Files |
|---|---|---|
| `examples/basic.lua` + `examples/printing_*.lua` | `01_basics/concept/` | ~4 files |
| `control_flow/` (10 files) | `02_control_flow/concept/` | ~8 files (trim goto duplicates) |
| `functions/` (11 files) | `03_functions/concept/` | ~8 files |
| `data_structures/` (5 files) | `04_tables/concept/` | All 5 |
| `strings/` (11 files) | `05_strings/concept/` | ~8 files |
| `iterators/` (10 files) | `06_iterators/concept/` | ~7 files (merge stateful dupes) |
| `files/` (7 files) + `io_system/` (7 files) | `07_files_io/concept/` | ~10 files (merge) |
| `classes/` (9 files) + `metatables/` (26 files) + `oop/` (2 files) | `08_metatables_oop/concept/` | ~15 files (merge, deduplicate) |
| `coroutines/` (12 files) | `09_coroutines/concept/` | ~8 files |
| `automation_scripts/` (6 files) + `arguments/` + `book_management/` + `system_tools/` | `10_cli_tools/concept/` + `project/` | ~8 files |

## What Gets Dropped

| Item | Reason |
|---|---|
| `debugger.lua` (669 lines) | Third-party (Scott Lembcke, MIT). Mention in README if useful, don't bundle. |
| `metatables-llama.md` | LLM output, not curriculum. |
| `bit_operations/` and `bits_operations/` | Merge into 01 or 03 (bit ops are just operations on numbers). Keep 1-2 best files. |
| `examples/event_driven.lua`, `examples/replacing_builtin_functions.lua`, `examples/restricted_env.lua` | Advanced/niche. Skip or move to a `reference/` appendix. |
| `games/` (5 files) | `guessing_game.lua` → 02 project. Rest are redundant. |
| `katas/` (7 files) | Keep as exercises for relevant groups. |
| `modules/` (2 files) | Lua's `require` is trivial. Merge into 03_functions or drop. |
| `neovim_modules/` (1 file) | Telescope example — niche, skip. |
| `reference_impl/` (5 files) | Move concepts into relevant groups. |
| `myFile.txt` (root + files/) | Test data. Keep in 07_files_io/ for file I/O demos. |

## Per-Group Content

### 01_basics — Lua Fundamentals
- **Concept**: Variables, types (nil, boolean, number, string, table), arithmetic, print, comments
- **Source**: `examples/basic.lua`, `examples/global_variables.lua`, + fresh
- **Project**: `calculator.lua` — REPL-style calculator (from existing `examples/calculator.lua`)

### 02_control_flow — Decisions and Loops
- **Concept**: if/elseif/else, while, repeat-until, numeric for, generic for, break, goto
- **Source**: `control_flow/` (10 files — trim to 8 best)
- **Project**: `guessing_game.lua` (from `games/guessing_game.lua`)

### 03_functions — First-Class Functions
- **Concept**: function syntax, multiple returns, varargs (...), closures, recursion, tail calls
- **Source**: `functions/` (11 files) + `closures/` (6 files)
- **Project**: `math_utils.lua` — library of math functions (factorial, fibonacci, prime check)

### 04_tables — The One Data Structure
- **Concept**: Tables as arrays, hash maps, nested tables, sorting, # operator, table.insert/remove
- **Source**: `data_structures/` (5 files)
- **Project**: `contact_list.lua` — simple CRUD with table of contacts

### 05_strings — Pattern Matching
- **Concept**: string.sub, find, gsub, gmatch, match, char/byte, format, reverse
- **Source**: `strings/` (11 files — trim to 8 best)
- **Project**: `log_parser.lua` — parse Apache-style logs, extract fields

### 06_iterators — Custom Iteration
- **Concept**: pairs vs ipairs, stateless iterators, stateful iterators, for loop simulation
- **Source**: `iterators/` (10 files, merge duplicates)
- **Project**: `range.lua` — `range(start, stop, step)` iterator library

### 07_files_io — Reading, Writing, Running
- **Concept**: io.open (r/w/a), io.lines, io.popen, os.execute, lfs (optional), dir listing
- **Source**: `files/` (7 files) + `io_system/` (7 files)
- **Project**: `dir_lister.lua` (from `automation_scripts/dir_lister.lua`)

### 08_metatables_oop — Lua's Object System
- **Concept**: setmetatable/getmetatable, __index, __newindex, __add/__sub, __tostring, __call, classes via metatables, inheritance
- **Source**: `metatables/` (26 files) + `classes/` (9 files) + `oop/` (2 files) — merge, deduplicate heavily
- **Project**: `vector3d.lua` — Vector class with operator overloading (from `metatables/vector3d-metatables.lua`)

### 09_coroutines — Cooperative Multitasking
- **Concept**: coroutine.create/resume/yield, producer-consumer, pipelines, schedulers
- **Source**: `coroutines/` (12 files)
- **Project**: `task_scheduler.lua` (from `coroutines/task_scheduler.lua`)

### 10_cli_tools — Building Real Tools
- **Concept**: arg parsing, config files, shell commands, error handling (pcall/xpcall), JSON
- **Source**: `automation_scripts/` (6 files) + `arguments/` + `error_debugging/` (7 files) + `system_tools/`
- **Project**: `book_management.lua` (269 lines, already complete — move as-is)

---

## Files by Group (Estimated)

| Group | Concept Files | Source Reuse |
|---|---|---|
| 01_basics | 5 | 60% from existing |
| 02_control_flow | 8 | 80% from control_flow/ |
| 03_functions | 8 | 70% from functions/ + closures/ |
| 04_tables | 6 | 80% from data_structures/ |
| 05_strings | 8 | 80% from strings/ |
| 06_iterators | 7 | 80% from iterators/ |
| 07_files_io | 8 | 70% from files/ + io_system/ |
| 08_metatables_oop | 12 | 60% (heavy deduplication from 37 source files) |
| 09_coroutines | 8 | 80% from coroutines/ |
| 10_cli_tools | 8 | 70% from automation_scripts/ + error_debugging/ |
| **Total** | **~78** | |

## What We're Actually Doing

This is **NOT** a rewrite like r_pyqt_practice (where old scripts were PyQt5 and everything became new PyQt6 files). This is a **reorganization**:

1. Take Carlos's existing Lua files — they're idiomatic Lua, they work
2. Move them into numbered group directories
3. Add README to each group (Quick Start + Learning Path + Patterns)
4. Add an exercises.lua per group (solved, runnable)
5. Identify the best existing project per group, move it into `project/`
6. Drop third-party code, LLM output, and duplicates
7. Write root README.md
8. Commit incrementally — one group per commit

**Reuse rate: ~75%** of existing code stays. The work is organization, not writing.

## REFERENCES.md — Recommended Books

Listed as resources, not bundled:

- *Programming in Lua* — Roberto Ierusalimschy (the Lua author's book — definitive)
- *Lua Quick Start Guide* — Gabor Szauer
- *Beginning Lua Programming* — Kurt Jung
- *Lua Mini Reference* — Harry Yoon (pocket reference)
- *Sysadmins: A Fast-Paced Guide to Scripting and Automation with Lua* — Mills R. (2024)
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/) — free, official
