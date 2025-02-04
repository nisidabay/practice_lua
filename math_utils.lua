#!/usr/bin/env lua
-- Example of using modules

local M = {}
function M.add(a, b)
	return a + b
end

function M.substract(a, b)
	return a - b
end

return M
