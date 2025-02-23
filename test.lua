#!/usr/sbin/lua
--
-- Testing vim.fn
local current_file = vim.fn.expand("%:p")
print(current_file)

local file_name= vim.fn.expand("%")
print(file_name)

local last_line=vim.fn.line("$")
print(last_line)

-- local string="ls -a"
-- local system_call=vim.fn.system(string)
-- print("system_call" .. system_call)

local bufnr= vim.fn.bufnr()
print("buffer number ".. bufnr)
