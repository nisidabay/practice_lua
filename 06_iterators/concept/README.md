# Iterators — Custom Iteration

pairs, ipairs, stateless iterators, stateful iterators, and generic for.

## Quick Start

```bash
lua iterator.lua              # Basic iterator factory
lua pairs_vs_ipairs.lua       # pairs (all keys) vs ipairs (sequential)
lua stateless_iterator.lua    # Stateless: function + invariant state
lua stateful_iterator-1.lua   # Stateful: closure that remembers state
lua fibonacciIterator.lua     # Real example: Fibonacci iterator
lua for_loop_simulation.lua   # Simulate numeric for with iterator
```

## Common Patterns

```lua
-- Stateless iterator
local function range(start, stop)
    local i = start - 1
    return function()
        i = i + 1
        if i <= stop then return i end
    end
end

for n in range(1, 5) do print(n) end  --> 1 2 3 4 5

-- pairs vs ipairs
for k, v in pairs(t) do ... end    -- any key
for i, v in ipairs(t) do ... end   -- 1,2,3... only

-- Stateful iterator (captures currentNumber across calls)
local function squares(limit)
    local n = 0
    return function()
        n = n + 1
        if n <= limit then return n, n * n end
    end
end

for num, sq in squares(3) do print(num, sq) end
--> 1  1
--> 2  4
--> 3  9
```

## Now Build Your Own

Build a `words` iterator that splits a string and yields one word at a time.
