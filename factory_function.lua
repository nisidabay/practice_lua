#!/usr/sbin/lua
--
-- Factory function
local function createPerson(name, age)
	local person = {
		name = name,
		age = age,
	}
	-- Add methods to the object
	function person:introduce()
		return "Hi, I'm " .. self.name .. " and I'm " .. self.age .. " years old"
	end
	function person:celebrateBirthday()
		self.age = self.age + 1
		return "Hapy Birtday! " .. self.name .. " is now " .. self.age .. "."
	end

	return person
end

local john = createPerson("john", 20)
print(john:introduce())
print(john:celebrateBirthday())
