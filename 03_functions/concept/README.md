# Functions — First-Class Values

Functions, multiple returns, varargs, closures, recursion, tail calls.

## Quick Start

```bash
lua factorial.lua                  # Recursive factorial
lua function_arguments.lua         # Multiple args, multiple returns
lua varargs.lua                    # Variable arguments (...)
lua factory_function.lua           # Functions that return functions
lua closure_function.lua           # Closures with captured state
lua recursion.lua                  # Classic recursion examples
lua tail_call_optimization.lua     # Tail call elimination
```

## Common Patterns

```lua
-- Multiple returns
local function minmax(a, b)
    if a < b then return a, b else return b, a end
end
local lo, hi = minmax(10, 5)

-- Varargs
local function sum(...)
    local t = 0
    for _, v in ipairs({...}) do t = t + v end
    return t
end

-- Closure
local function counter()
    local n = 0
    return function() n = n + 1; return n end
end
```

## Now Build Your Own

Write a `map` function that takes a table and a function, returns a new table with the function applied to each element.
