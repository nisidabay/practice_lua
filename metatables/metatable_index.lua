#!/usr/bin/lua

local person = {
	name = "Peter",
	age = 59,
}

-- The purporse of __index is to handle cases when a key is not found
local person_metatable = {
	__index = function(_, key)
		print("key not found: " .. key)
	end,
}

setmetatable(person, person_metatable)

print(person.name)
print(person.age)
print(person.city)
