# Tables — Lua's One Data Structure

Arrays, hash maps, nested tables, and sorting.

## Quick Start

```bash
lua print_array.lua           # Array indexing and printing
lua nestedTables.lua          # Tables within tables
lua sort_table.lua            # table.sort with custom comparator
lua count_table_elements.lua  # Counting and iterating
lua multidimensional_array.lua # 2D arrays
```

## Common Patterns

```lua
-- Array
local fruits = {"apple", "banana", "cherry"}
print(fruits[1])  --> apple (1-indexed!)

-- Hash map
local person = {name = "Carlos", age = 30}
print(person.name)  --> Carlos

-- Insert and remove
table.insert(fruits, "date")
table.remove(fruits, 2)

-- Sort
table.sort(fruits)
```

## Now Build Your Own

Build a contact list: a table of tables, each with name/email/phone. Write functions to add, search, and list contacts.
