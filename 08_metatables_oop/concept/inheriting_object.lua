#!/usr/bin/env lua
--
-- Lua inheritance receiving object as parameter

Person = {}
Person.__index = Person

function Person.new(name, age)
	local self = setmetatable({}, Person)
	self.name = name
	self.age = age
	return self
end

function Person:greet()
	return string.format("Hello, %s you're %d", self.name, self.age)
end

Student = {}
Student.__index = Student
setmetatable(Student, Person)
function Student.new(person, grade, school)
	local self = setmetatable(person, Student)
	self.grade = grade
	self.school = school
	return self
end

function Student:greet()
	return string.format("Hello, %s you're %d you study in %s", self.name, self.age, self.school)
end

local carlos = Person.new("Carlos", 20)
print(carlos:greet())

-- Reuse carlos to create a student
local student = Student.new(carlos, "A", "UCLA")
print(student:greet())
