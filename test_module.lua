#!/usr/bin/env lua
--
-- Create a test module

M = {
	name = "John",
	surname = "Smith",
}

function M.greet()
	return "Hello, " .. M.name .. "  " .. M.surname
end

return M
