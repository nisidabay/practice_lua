#!/usr/bin/env lua
--
-- Implement the tostring method

local Animal = {}
Animal.__index = Animal

function Animal:New(attributes)
	local instance = {}
	setmetatable(instance, Animal)
	instance._attributes = {
		name = attributes.name or "Unknown",
		kind = attributes.kind or "Unknown",
		breed = attributes.breed or "Unknown",
		age = attributes.age or 0,
	}
	return instance
end

function Animal:__tostring()
	return self._attributes.name ..
		" " ..
		self._attributes.kind .. " " .. self._attributes.breed .. " " .. tostring(self._attributes.age)
end

function Animal:GetName()
	return "Name: " .. self._attributes.name
end

function Animal:GetKind()
	return "Kind: " .. self._attributes.kind
end

function Animal:GetBreed()
	return "Breed: " .. self._attributes.breed
end

function Animal:GetAge()
	return "Age: " .. self._attributes.age
end

local Fido = Animal:New({
	name = "Fido",
	kind = "Dog",
	breed = "Doberman",
	age = 2
})

print(Fido)
print(Fido:GetName())
print(Fido:GetKind())
print(Fido:GetBreed())
print(Fido:GetAge())

local Tom = Animal:New({
	name = "Tom",
	kind = "Cat",
	breed = "Cartoon",
	age = 5
})

print(Tom)
