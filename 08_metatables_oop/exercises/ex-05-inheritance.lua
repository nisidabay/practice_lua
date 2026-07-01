#!/usr/bin/env lua
-- Exercise: Inheritance (Animal → Dog)
--
-- Instructions: Create an Animal base class with speak() returning
-- "name makes a sound". Then create Dog subclass that overrides speak()
-- to return "name barks!". Both use the __index metatable pattern.

-- TODO: Create Animal class: __index, new(name), speak()
-- TODO: Create Dog subclass: __index = Dog, inherit Animal
-- TODO: Dog.new(name) — call Animal.new then reset metatable to Dog
-- TODO: Dog:speak() — override to return self.name .. " barks!"
-- TODO: Create a Dog named "Rex" and print rex:speak()

-- Verification (DO NOT MODIFY)
-- Expected: "Rex barks!"
-- Solution: see exercises.lua
