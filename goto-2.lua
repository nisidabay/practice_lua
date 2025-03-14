#!/usr/bin/env lua
--
-- Use goto to skip certain words
local words = { "hello", "world", "skip", "this", "word" }

for _, word in ipairs(words) do
    if word == "skip" then
        goto continue
    end
    print(word)
    ::continue::
end
