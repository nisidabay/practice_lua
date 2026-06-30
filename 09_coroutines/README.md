# Coroutines — Cooperative Multitasking

Voluntary yield and resume: coroutines for pipelines, producers, and schedulers.

## Structure

```
09_coroutines/
├── concept/      # 7 teaching files covering core concepts
├── exercises/    # 6 interactive practice files with TODO sections
├── exercises.lua # Solved reference solutions
└── project/      # Task scheduler
```

## How to Use This Group

1. Start with `concept/`: read each file in order
2. Practice with `exercises/`: each file has a `-- TODO` section for your implementation
3. Build the task scheduler

## Concepts Covered

- `coroutine.create` and `coroutine.resume`
- `coroutine.yield` with values
- `coroutine.status` and `coroutine.wrap`
- Producer-consumer pattern
- Data pipelines with coroutines
- Round-robin task scheduler

## Project

**Task scheduler** — runs multiple coroutines in a round-robin loop, simulating cooperative multitasking.

## What's Next

→ [CLI Tools](../10_cli_tools/) — real automation with arguments, config files, and error handling

← [Metatables & OOP](../08_metatables_oop/) — review OOP patterns
