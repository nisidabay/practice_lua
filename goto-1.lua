#!/usr/bin/env lua
--
-- Use goto to skip even numbers
-- Initialize the counter variable
local counter = 1

-- Loop through numbers 1 to 10
while counter <= 10 do
    -- Check if the number is even
    if counter % 2 == 0 then
        goto continue
    end

    -- Print the odd number
    print(counter)

    ::continue::
    -- Increment the counter
    counter = counter + 1
end
