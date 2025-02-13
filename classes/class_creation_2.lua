#!/usr/bin/lua
--
-- Define a class called 'Person'
-- This class represents a person with a name and age.
-- In Lua, classes are simulated using tables and metatables.
Person = {}
Person.__index = Person  -- Set the __index metamethod to allow method access

--- Constructor for the Person class
-- @param name The name of the person
-- @param age The age of the person
-- @return A new instance of the Person class
-- The constructor function creates a new table (instance) and sets its
-- metatable to Person.
-- This allows the instance to access methods defined in the Person table.
function Person:new(name, age)
    local instance = {}
	setmetatable(instance, Person)  -- Create a new instance and set its metatable
    instance.name = name  -- Assign the name to the instance
    instance.age = age    -- Assign the age to the instance
    return instance       -- Return the new instance
end

--- Method to greet using the person's name
-- This method prints a greeting message using the instance's name.
-- The 'self' parameter refers to the instance on which the method is called.
function Person:greet()
    print("Hello, I am " .. self.name)
end

-- Create an instance of the Person class
-- The 'new' method is called to create a new Person instance with the given
-- name and age.
local person1 = Person:new("Alice", 30)
person1:greet()  -- Output: Hello, I am Alice

