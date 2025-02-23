#!/usr/sbin/lua
--
-- Passing arguments to functions
local setup = function(opts)
	if opts.default == nil then
		opts.default = 17
	end
	print(opts.default, opts.other)
end
setup({ default = 12, other = false })
setup({ other = true })
setup({})
