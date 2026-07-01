#!/usr/bin/env lua
-- Exercise: Simple class (Counter)
--
-- Instructions: Create a Counter class using the Lua metatable pattern.
-- Counter.__index = Counter for method lookup.
-- Constructor Counter.new(start) creates instances with a value field.
-- Methods: inc() increments value by 1, get() returns the current value.

-- TODO: Create Counter class table with __index
-- TODO: Implement Counter.new(start) — setmetatable on {value = start or 0}
-- TODO: Implement Counter:inc() — increment self.value and return it
-- TODO: Implement Counter:get() — return self.value
-- TODO: Create a counter, call inc() 3 times, print get()

-- Verification (DO NOT MODIFY)
-- Expected: Counter: 3
-- Solution: see exercises.lua
