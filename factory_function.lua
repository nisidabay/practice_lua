#!/usr/bin/env lua
--- Factory Function Example
-- Demonstrates a factory function pattern for creating person objects.
-- @module factory_function

local M = {}

--- Creates a new person object with the given name and age
-- @param name string The name of the person
-- @param age number The age of the person
-- @return table A person object with introduce and celebrateBirthday methods
function M.createPerson(name, age)
    local person = {
        name = name,
        age = age,
    }

    --- Introduces the person
    -- @return string Introduction message
    function person:introduce()
        return "Hi, I'm " .. self.name .. " and I'm " .. self.age .. " years old"
    end

    --- Celebrates the person's birthday by incrementing their age
    -- @return string Birthday message with updated age
    function person:celebrateBirthday()
        self.age = self.age + 1
        return "Happy Birthday! " .. self.name .. " is now " .. self.age .. "."
    end

    return person
end

-- Main execution
local function main()
    local john = M.createPerson("john", 20)
    print(john:introduce())
    print(john:celebrateBirthday())
end

main()

return M
