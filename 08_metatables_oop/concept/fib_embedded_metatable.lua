#!/usr/sbin/lua
--
-- Create a table with an embedded metatable for Fibonacci calculation
local fib = {
    -- Define the metatable directly within the table
    __index = function(self, key)
        if key < 2 then
            return 1
        end
        self[key] = self[key - 2] + self[key - 1]
        print("key is: " .. key)  -- Print the current key being calculated
        return self[key]
    end,
}

-- Set the metatable for the table to itself
setmetatable(fib, fib)

-- Access the 5th Fibonacci number
print(fib[5])  -- This will print the 5th Fibonacci number
