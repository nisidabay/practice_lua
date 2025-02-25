#!/usr/sbin/lua
--
-- Returns a copy of str in which all or "n" if given, occurrences of the
-- pattern have been replaced by the replacement string repl.
local str = "Hello world, goodbye world"
local new_str = string.gsub(str, "world", "moon", 1)

if new_str then
	print(new_str)
else
	print("No substitution made")
end
