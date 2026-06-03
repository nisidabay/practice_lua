# Metatables & OOP — Lua's Object System

__index, __newindex, __add, __tostring, classes, and inheritance.

## Quick Start

```bash
lua metatable_index.lua                       # __index for default values / delegation
lua adding_newindex.lua                       # __newindex intercepts writes
lua metable_arithmetics.lua                   # __add, __sub operator overloading
lua tostring_table.lua                        # __tostring custom display
lua metables-formatOutput.lua                 # Table formatting via metatable
lua list_like_behavior.lua                    # Table mimicking array with bounds
lua metatable_strict_access.lua               # Block access to missing keys
lua class_creation_2.lua                      # Class pattern via metatable
lua class_inheritance_with_encapsulation.lua  # Full inheritance with protected fields
lua vector3d-metatables.lua                   # Complete Vector3D with __add/__tostring
```

## Common Patterns

```lua
-- Default value via __index
local mt = {__index = function(t, k) return 0 end}
local t = setmetatable({}, mt)
print(t.anything)  --> 0

-- Vector addition via __add
local vec_mt = {}
vec_mt.__tostring = function(v) return string.format("(%d,%d)", v.x, v.y) end
vec_mt.__add = function(a, b) return setmetatable({x=a.x+b.x, y=a.y+b.y}, vec_mt) end
local v1 = setmetatable({x=1, y=2}, vec_mt)
local v2 = setmetatable({x=3, y=4}, vec_mt)
print(tostring(v1 + v2))  --> (4,6)

-- Write protection via __newindex
local protected = setmetatable({}, {
    __newindex = function(t, k, v)
        if k:match("^_") then print("private:", k) else rawset(t, k, v) end
    end
})

-- Class pattern
local Dog = {}
Dog.__index = Dog
function Dog.new(name) return setmetatable({name = name}, Dog) end
function Dog:bark() return self.name .. " says woof!" end
```

## Now Build Your Own

Build a Vector3D class with __add, __sub, __tostring, and a `magnitude()` method.
