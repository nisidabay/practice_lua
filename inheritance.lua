#!/usr/bin/lua

--- Pet module defines a basic pet with a name and status.
local function Pet(name)
	local pet = {
		name = name or "Einstein",
		status = "Hungry",
	}

	--- Feed the pet, changing its status to "Full".
	function pet:feed()
		print(self.name .. " is fed")
		self.status = "Full"
	end

	return pet
end

--- Dog module extends Pet and adds breed and loyalty.
local function Dog(name, breed)
	local dog = Pet(name)
	dog.breed = breed
	dog.loyalty = 0

	--- Check if the dog is loyal based on its loyalty level.
	function dog:is_loyal()
		return self.loyalty >= 10
	end

	--- Feed the dog, increasing its loyalty level.
	function dog:feed()
		print(self.name .. " is fed")
		self.status = "Full"
		self.loyalty = self.loyalty + 10
	end

	--- Make the dog bark.
	function dog:bark()
		print("Woof Woof")
	end

	return dog
end

local lassy = Dog("Lassy", "Poodle")
print(lassy.breed)
lassy:feed()

if lassy:is_loyal() then
	print("Will protect against intruders")
else
	print("Will not protect against intruders")
end
