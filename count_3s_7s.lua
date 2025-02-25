#!/usr/sbin/lua
-- 
-- Count numbers 3 and 7
local MAX_NUMBERS = 5
local input_buffer = ""
local seven_count = 0
local three_count = 0
local data = {}
local idx = 0

-- Prompt the user for input
io.write("Enter up to " .. MAX_NUMBERS .. " numbers separated by spaces: ")
input_buffer = io.read("*line")

-- Parse the input string and populate the data array
for token in string.gmatch(input_buffer, "%S+") do
  if idx < MAX_NUMBERS then
    local num = tonumber(token)
    if num then
      data[idx + 1] = num
      idx = idx + 1
    end
  end
end

-- Count the number of 3s and 7s in the data array
for i = 1, idx do
  if data[i] == 3 then
    three_count = three_count + 1
  elseif data[i] == 7 then
    seven_count = seven_count + 1
  end
end

-- Print the results
print("Number of 3s: " .. three_count)
print("Number of 7s: " .. seven_count)

