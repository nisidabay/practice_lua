# Metatables & OOP — Lua's Object System

Metatables give Lua its flexible object-oriented capabilities.

## Structure

```
08_metatables_oop/
├── concept/      # 10 teaching files covering core concepts
├── exercises/    # 6 interactive practice files with TODO sections
├── exercises.lua # Solved reference solutions
└── project/      # Vector3D class
```

## How to Use This Group

1. Start with `concept/`: read each file in order
2. Practice with `exercises/`: each file has a `-- TODO` section for your implementation
3. Build the Vector3D class

## Concepts Covered

- `__index` for default values and delegation
- `__newindex` for write interception
- `__add` and `__sub` operator overloading
- `__tostring` custom display
- Class pattern via metatable + `__index`
- Inheritance via prototype chain
- Write protection with `__newindex`

## Project

**Vector3D class** — a 3D vector with `__add`, `__sub`, `__tostring`, and a `magnitude()` method.

## What's Next

→ [Coroutines](../09_coroutines/) — cooperative multitasking

← [Files & I/O](../07_files_io/) — review file operations
