#!/usr/sbin/lua
--
--Returns an iterator function that, each time it is called, returns the next
--captures from the pattern over the string `s`.
local str = "The quick brown fox jumps over the lazy dog"
for word in string.gmatch(str, "%a+") do
	print(word)
end
