#!/usr/bin/env lua
--
-- Use of goto to skip negative numbers
local numbers = { -2, 0, 3, -1, 4, 5 }
local index = 1

repeat
    if numbers[index] <= 0 then
        goto continue
    end
    print(numbers[index])
    ::continue::
    index = index + 1
until index > #numbers
