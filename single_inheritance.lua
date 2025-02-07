#!/usr/sbin/lua
--
-- Single inheritance
--
-- Base class Animal
Animal = {}

--- Constructor for Animal
-- @param object The object to initialize
-- @return A new instance of Animal
function Animal:new(object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	return object
end

--- Method to make the animal sound
function Animal:makeSound()
	if self.sound then
		print(self.sound)
	else
		print("Unknown sound")
	end
end

-- Dog class inheriting from Animal
Dog = Animal:new()

-- Cat class inheriting from Animal
Cat = Animal:new()
Cat.sound = "meow"
Cat.angry = false

--- Override method to make the cat sound
function Cat:makeSound()
	if self.angry then
		print("hissss")
	else
		print(self.sound)
	end
end

-- Create a Dog instance
local lassie = Dog:new()
lassie.sound = "woof"
lassie:makeSound()

-- Create a Cat instance and make it sound
local tom = Cat:new()
tom.angry = true
tom:makeSound()

-- Create a Frog animal
local frog = Animal:new({ sound = "froggy" })
frog:makeSound()

-- Create an unknown animal
local unknownAnimal = Animal:new()
unknownAnimal:makeSound()
