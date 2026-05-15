#!/usr/bin/env lua
--- Class Inheritance Example
-- Demonstrates class-based inheritance in Lua using metatables.
-- @module class_inheritance

local M = {}

--- Person class representing a person with a name
-- @table Person
local Person = {}
Person.__index = Person

--- Creates a new Person instance
-- @param name string The name of the person
-- @return table A new Person instance
-- @error if name is not a string
function Person:new(name)
    if type(name) ~= "string" then
        error("Invalid name! Expected string, got " .. type(name))
    end
    local instance = { name = name }
    setmetatable(instance, self)
    return instance
end

--- Prints a greeting message
function Person:sayHello()
    print("Hello, " .. self.name)
end

--- Student class extending Person with age attribute
-- @table Student
local Student = setmetatable({}, { __index = Person })
Student.__index = Student

--- Creates a new Student instance
-- @param name string The name of the student
-- @param age number The age of the student
-- @return table A new Student instance
function Student:new(name, age)
    local instance = Person:new(name)
    instance.age = age
    setmetatable(instance, Student)
    return instance
end

--- Prints the age of the student
function Student:sayAge()
    print(self.name .. " is " .. self.age .. " years old")
end

-- Export classes
M.Person = Person
M.Student = Student

-- Main execution
local function main()
    -- Create and use Person instance
    local person = Person:new("Alicia")
    person:sayHello()

    -- Create and use Student instance
    local student = Student:new("Alicia", 24)
    student:sayHello()
    student:sayAge()

    -- Test error handling with invalid input
    local success, err = pcall(function()
        return Person:new(12)
    end)

    if not success then
        print("Expected error caught: " .. err)
    end
end

main()
