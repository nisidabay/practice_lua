#!/usr/sbin/lua
--
-- Sort a table by name
--
local students = {
	{ name = "Miles Davis", instrument = "trumpet" },
	{ name = "John Coltrane", instrument = "saxophone" },
	{ name = "Bill Evans", instrument = "piano" },
	{ name = "Wynton Kelly", instrument = "piano" },
}

-- Sort the students table by name in ascending order
table.sort(students, function(a, b)
	return a.name < b.name
end)

-- Print the sorted table
for _, student in ipairs(students) do
	print(student.name .. " - " .. student.instrument)
end
