#!/usr/bin/lua
--[[
You have a person table with fields name and age.

You also have a personMetatable table with a greet function.

By setting the metatable of person like this: setmetatable(person, { __index =
personMetatable }), you are telling Lua that when a key is not found in the
person table, it should look in the personMetatable table.

When you call person:greet(), Lua first checks if greet is a key in the person
table. Since it's not, Lua looks in the metatable (personMetatable) and finds
the greet function there. It then calls this function with person as the self
parameter.

If you add more functions or fields to personMetatable, they will be accessible
to the person table as if they were part of the person table itself.

So, in summary, setting __index = personMetatable allows you to extend the
functionality of the person table by providing a fallback to the personMetatable
when keys are not found in the person table itself. This is a common technique
for implementing object-oriented behavior and method inheritance in Lua.
--]]

-- Create a table 'person'
local person = {
	name = "John",
	age = 30,
}

local personMetatable = {
	greet = function(self)
		print("Hello, my name is " .. self.name .. " and I'm " .. self.age .. " years old.")
	end,
}

-- Associate the metatable with the 'person' table
setmetatable(person, { __index = personMetatable })

-- Now the metatable affects the behavior of the 'person' table
person:greet()

personMetatable.newField = "I'm a new field"

print(personMetatable.newField) -- Should print "I'm a new field"

print("table fields:")
for k, v in pairs(personMetatable) do
	print(k, v)
end
