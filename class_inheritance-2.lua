#!/usr/bin/env lua

-- Define the Person class
local Person = {}
Person.__index = Person

-- Constructor for Person
function Person:new(name)
    local instance = setmetatable({}, Person)
    instance.name = name
    return instance
end

-- Custom index function to modify behavior of accessing 'name'
function Person:__index(key)
    if key == "name" then
        return string.upper(rawget(self, key))
    else
        return rawget(self, key)
    end
end

-- Define the Employee class inheriting from Person
local Employee = {}
setmetatable(Employee, { __index = Person })
Employee.__index = Employee

-- Constructor for Employee
function Employee:new(name)
    local instance = Person.new(self, name)
    setmetatable(instance, Employee)
    return instance
end

-- Create a new Employee instance and print the name
local employeeInstance = Employee:new("John Doe")
print(employeeInstance.name) -- prints: JOHN DOE
