#!/usr/bin/lua

-- Define a table with initial elements
local dataTable = { "a", "Carlos", 1 }

-- Create a metatable with custom behaviors
local customFormatter = {
    -- Custom __tostring function to provide a formatted string representation
    __tostring = function(tbl)
        local result = "{"
        for index, value in ipairs(tbl) do
            result = result .. index .. "=" .. value .. ", "
        end
        -- Substitute the last ", " with "}"
        result = result:sub(1, -3) .. "}"
        return result
    end,
}

-- Set the custom metatable for the dataTable
setmetatable(dataTable, customFormatter)

-- Print the table using the custom __tostring behavior
print(dataTable)
