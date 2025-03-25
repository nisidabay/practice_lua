#!/usr/bin/env lua

-- Define a class named MyLuaClass
-- This class represents a person with a name

local MyLuaClass = {}
MyLuaClass.__index = MyLuaClass

-- Constructor for MyLuaClass
-- @param name: The name of the person (string)
-- @return: A new instance of MyLuaClass
function MyLuaClass:new(name)
	if type(name) ~= "string" then
		error("Invalid name!")
	end
	local instance = { name = name }
	setmetatable(instance, self) -- setmetatable(instance, MyLuaClass)
	return instance
end

-- Method to print a greeting
function MyLuaClass:sayHello()
	if self then
		print("Hello " .. self.name)
	end
end

-- Define a subclass named SubClass
-- This subclass extends MyLuaClass to include age

local SubClass = {}
setmetatable(SubClass, { __index = MyLuaClass })

-- Constructor for SubClass
-- @param name: The name of the person (string)
-- @param age: The age of the person (number)
-- @return: A new instance osnip-next-choicef SubClass
function SubClass:new(name, age)
	local instance = MyLuaClass:new(name)
	instance.age = age
	setmetatable(instance, self)
	self.__index = self
	return instance
end

-- Method to print the age of the person
function SubClass:sayAge()
	print(self.name .. " is " .. self.age .. " years old")
end

-- Create an instance of MyLuaClass
local person = MyLuaClass:new("Alicia")
person:sayHello()

-- Create an instance of SubClass
local person_age = SubClass:new("Alicia", 24)
person_age:sayHello()
person_age:sayAge()

-- Test case: Attempt to create a MyLuaClass instance with a non-string name
local success, test = pcall(MyLuaClass.new, MyLuaClass, 12)
if success and test then
	test:sayHello()
else
	print("Failed to create MyLuaClass instance with non-string name.")
end
