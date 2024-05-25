-- Create a nested table
local nestedTable = {
	{ name = "Alice", age = 25 },
	{ name = "Bob", age = 30 },
	{ name = "Charlie", age = 35 },
}

-- Print the original nested table
print("Original Table:")
for i, person in ipairs(nestedTable) do
	print(i, person.name, person.age)
end

-- Add a new person to the nested table
local newPerson = { name = "David", age = 28 }
table.insert(nestedTable, newPerson)

-- Modify an existing element in the nested table
nestedTable[2].age = 31

-- Delete an element from the nested table
table.remove(nestedTable, 3)

-- Print the modified nested table
print("\nModified Table:")
for i, person in ipairs(nestedTable) do
	print(i, person.name, person.age)
end
