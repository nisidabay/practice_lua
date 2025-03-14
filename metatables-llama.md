Lua Metatables
==============

In Lua, tables are first-class citizens and can be used as if they were any
other data type. This is achieved through a concept called "metatables." A
metatable is an object that defines the behavior of table operations.

Creating Tables with Metatables
-------------------------------

To create a new table in Lua using metatables, you need to specify the metatable
when creating it. The most common use cases are:

- Creating tables for user input (e.g., `user_input` table)
- Setting default values or initializing tables for specific fields

```lua
local user_input = {
  name = "John Doe",
  age = 25,
}

-- Create a new table using metatable
local person = setmetatable(user_input, { __index = function(t, k)
  if k == "name" then
    return string.upper(t[k])
  else
    return t[k]
  end
end})

print(person.name)  -- prints: JOHN DOE
```

In this example, `person` is a table with two fields. The
`setmetatable(user_input, { __index = ... }` line creates the `__index`
metamethod for tables, which allows accessing other tables using dot notation
(e.g., `person.name`) or bracket notation (`person["name"]`).

When you access an invalid key in a table that has metatable inheritance, Lua
will use the default values defined in the parent tables.

```lua
local person = {
  name = "John Doe",
}

-- Accessing 'name' with dot notation
print(person.name)  -- prints: John Doe

-- Trying to access 'non_existent_key'
if not pcall(function() print(person.non_existent_key) end) then
  print("Table does not have this key")
end
```

In the above example, accessing `person.non_existent_key` results in an error
because it doesn't exist.

Defining Metatable Functions
-----------------------------

You can also define custom metamethods on a table using `__index`. These are
functions that are called when you access a specific field of a table. Here's
how to define one:

```lua
local person = setmetatable({}, { __index = function(t, k)
  if k == "name" then
    return "You clicked the button"
  else
    return nil
  end
end})

print(person.name)  -- prints: You clicked the button
```

In this example, `__index` is called when you try to access a non-existent key.
The metamethod returns a custom message for the key `name`.

Metatable Inheritance
---------------------

Another feature of metatables is inheritance. Lua supports multiple levels of
metatable inheritance, where one table inherits from another. This means you can
create a hierarchy of tables and override functions or values at each level.

Here's an example:

```lua
local Person = {}
Person.__index = Person

function Person:new(name)
  local instance = setmetatable({}, Person)
  instance.name = name
  return instance
end

function Person:__index(k)
  if k == "name" then
    return string.upper(rawget(self, k))
  else
    return rawget(self, k)
  end
end

local Employee = setmetatable({}, { __index = Person })
Employee.__index = Employee

function Employee:new(name)
  local instance = Person.new(self, name)
  setmetatable(instance, Employee)
  return instance
end

local emp = Employee:new("John Doe")
print(emp.name)  -- prints: JOHN DOE
```

In this example, `Person` is the parent table with a custom metamethod, and
`Employee` is the child table that inherits from it. The `Employee` table can
override or extend the behavior defined in `Person`.
