#!/usr/bin/lua
---
--- Pet module defines a basic pet with a name and status.
-- @param name The name of the pet. Defaults to "Einstein" if not provided.
-- @return A pet object with methods to interact with it.
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
-- @param name The name of the dog.
-- @param breed The breed of the dog.
-- @return A dog object with additional methods specific to dogs.
local function Dog(name, breed)
	local dog = Pet(name)
	dog.breed = breed
	dog.loyalty = 0

	--- Check if the dog is loyal based on its loyalty level.
	-- @return True if the dog's loyalty level is 10 or higher, false otherwise.
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

-- Example usage of the Dog module.
local lassy = Dog("Lassy", "Poodle")
print(lassy.breed)  -- Output the breed of the dog.
lassy:feed()  -- Feed the dog, which also increases its loyalty.

-- Check if the dog is loyal and print the appropriate message.
if lassy:is_loyal() then
	print("Will protect against intruders")
else
	print("Will not protect against intruders")
end
