# Lua — A Hands-On Scripting Curriculum

Progressive learning path from variables to real CLI automation. Lua is the language of Neovim, Redis, Wireshark, and game engines.

## Prerequisites

```bash
lua -v    # Lua 5.4+ likely already installed
```

## Learning Path

| # | Module | Project |
|---|--------|---------|
| 01 | basics | Interactive calculator |
| 02 | control_flow | Number guessing game |
| 03 | functions | Math utility library |
| 04 | tables | Contact list manager |
| 05 | strings | Log file parser |
| 06 | iterators | Fibonacci iterator |
| 07 | files_io | Directory lister |
| 08 | metatables_oop | Vector3D class |
| 09 | coroutines | Task scheduler |
| 10 | cli_tools | Full book manager (JSON, CLI) |

## Structure

```
NN_groupname/
├── concept/          # Progressive teaching files
│   └── README.md     # Quick start, learning path, patterns
├── exercises.lua     # Solved reference solutions
├── exercises/        # ✏️ Interactive practice — fill in the TODO sections
│   ├── ex-01-xxx.lua
│   └── ...
└── project/          # One real mini-application
```

## How to Practice

1. Open an exercise file in the `exercises/` directory
2. Read the instructions and find the `-- TODO` section
3. Fill in the implementation
4. Run: `lua exercises/ex-01-xxx.lua`
5. Check the output matches the expected values
6. Stuck? Check `exercises.lua` for the solution
