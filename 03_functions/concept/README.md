# Functions — First-Class Values

Multiple returns, varargs, closures, recursion, tail calls, factories.

## Quick Start

```bash
lua factorial.lua               # Tail-recursive factorial
lua function_arguments.lua      # Multiple args, multiple returns
lua varargs.lua                 # Variable arguments (...)
lua factory_function.lua        # Functions that return functions
lua closure_function.lua        # Closures with captured state
lua counter_closure.lua         # Closure maintaining mutable state
lua accumulator_closure.lua     # Closure accumulating values
lua closure_call_twice.lua      # Calling a closure twice
lua closure-dotter.lua          # Closure that builds dot-separated output
lua odd_even_closure.lua        # Closure tracking odd/even state
lua functions_as_assignments.lua # Functions assigned to variables
lua function_on_table.lua       # Functions operating on table data
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

-- Closure (captures n across calls)
local function counter()
    local n = 0
    return function() n = n + 1; return n end
end

-- Tail call (no stack growth)
local function fact_tail(n, acc)
    if n == 0 then return acc end
    return fact_tail(n - 1, n * acc)
end
```

## Now Build Your Own

Write a `map` function: takes a table and a function, returns a new table with the function applied to each element.
