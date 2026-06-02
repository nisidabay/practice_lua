# Metatables & OOP — Lua's Object System

__index, __newindex, __add, __tostring, __call, classes, and inheritance.

## Quick Start

```bash
lua metatable_index.lua              # __index for default values
lua adding_newindex.lua              # __newindex for write control
lua metable_arithmetics.lua          # __add, __sub operator overloading
lua tostring_table.lua               # __tostring for custom display
lua list_like_behavior.lua           # Table that behaves like a list
lua class_creation_2.lua             # Class via metatable
lua class_inheritance_with_encapsulation.lua  # Inheritance pattern
```

## Common Patterns

```lua
-- Default value metatable
local defaults = {__index = function(t, k) return 0 end}
local t = setmetatable({}, defaults)
print(t.anything)  --> 0

-- Vector addition
local mt = {
    __add = function(a, b)
        return {x = a.x + b.x, y = a.y + b.y}
    end
}
local v1 = setmetatable({x=1, y=2}, mt)

-- Class
local Dog = {}
Dog.__index = Dog
function Dog.new(name)
    return setmetatable({name = name}, Dog)
end
```

## Now Build Your Own

Build a Vector3D class with __add, __sub, __tostring, and a `magnitude()` method.
