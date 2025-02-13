#!/usr/sbin/lua
--
-- Create a restricted environment
-- This script sets up a sandboxed environment where only specific functions are
-- allowed.
-- The allowed functions in this environment are 'print' and 'tonumber'.

local env = {
	print = print, -- Allow only 'print'
	tonumber = tonumber, -- Allow 'tonumber'
}

-- Function to run code in the sandboxed environment
-- @param code: A string containing the Lua code to be executed in the sandbox.
-- @return: The result of the executed code, or an error if the code fails to load or execute.
local function runSandboxedCode(code)
	local func, err = load(code, "sandbox", "t", env) -- Load code with custom _ENV
	if func then
		return func()
	else
		error(err)
	end
end

-- Run some code in the sandbox
-- The following code is executed within the restricted environment defined above.
-- It demonstrates the allowed and disallowed operations within the sandbox.
runSandboxedCode([[
    print("Hello from sandbox!")  -- Works: 'print' is allowed in the sandbox environment
    print(tonumber("123"))        -- Works: 'tonumber' is allowed in the sandbox environment
    print(os.date())              -- Error: 'os' is not allowed in the sandbox environment, resulting in an error
]])
