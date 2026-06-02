# Control Flow — Decisions and Loops

if/else, while, for, repeat-until, do-end blocks, goto, and break.

## Quick Start

```bash
lua conditional.lua             # if/elseif/else
lua while_loop.lua              # while loop
lua for_loop.lua                # numeric for, generic for
lua do_end_block.lua            # Local scope blocks
lua break_nested_loops.lua      # Breaking out of nested loops
lua goto_skip_event_numbers.lua # goto for flow control
lua is_prime.lua                # Real algorithm: prime number check
```

## Learning Path

| File | Concept |
|------|---------|
| `conditional.lua` | if/elseif/else, comparison operators |
| `while_loop.lua` | while, break, infinite loop guard |
| `for_loop.lua` | numeric for (start, stop, step), generic for |
| `do_end_block.lua` | do/end creates a new scope |
| `break_nested_loops.lua` | break only exits the innermost loop |
| `goto_skip_event_numbers.lua` | goto/label as structured jump |
| `is_prime.lua` | Algorithm practice: prime number check |

## Common Patterns

```lua
-- if/else
if score >= 90 then
    print("Excellent")
elseif score >= 60 then
    print("Pass")
else
    print("Fail")
end

-- Numeric for
for i = 1, 10, 2 do  -- start, end, step
    print(i)
end

-- While
local i = 1
while i <= 5 do
    print(i); i = i + 1
end
```

## Now Build Your Own

Write a FizzBuzz script: for numbers 1 to 20, print "Fizz" if divisible by 3, "Buzz" if divisible by 5, "FizzBuzz" if both, otherwise the number.
