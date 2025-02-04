#!/usr/bin/env lua
--
-- Make a counter closure
local function makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

-- Call the counter function
local counter = makeCounter()
print("Counter Example:")
print(counter()) -- Output: 1
print(counter()) -- Output: 2

