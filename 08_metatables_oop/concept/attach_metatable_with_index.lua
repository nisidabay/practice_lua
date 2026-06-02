#!/usr/bin/env lua
--
-- Attach a metatable with __index

local defaults = { retries = 3, debug = false }
local config = { timeout = 30 }

-- Create a metatable that delegates missing keys to 'defaults'
local mt = { __index = defaults }
-- Attach it
setmetatable(config, mt)

print(config.timeout) -- found in config
print(config.retries) -- found in defaults

--How it works:
-- Lua sees `config.retries`.
-- `retries` is not in `config`.
-- Lua checks if `config` has a metatable with `__index`.
--- It finds `__index = defaults` (a table).
-- So it returns `defaults.retries`.

-- ✅ **Rule**: If `__index` is a **table**, Lua looks up the key in that
-- table.
