#!/usr/bin/env lua
-- Parse numbers from input. Demo uses hardcoded string.

local input = "10 20 30 40"
local numbers = {}

for value in input:gmatch("%S+") do
    local n = tonumber(value)
    if n then table.insert(numbers, n) end
end

local sum = 0
for _, v in ipairs(numbers) do sum = sum + v end
print("Numbers:", table.concat(numbers, ", "))
print("Sum:", sum)

-- In a real program, you'd read from io.stdin:
--   local input = io.read("*line")
