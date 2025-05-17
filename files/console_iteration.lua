#!/usr/bin/env lua
--
-- io.read, io.write for console interaction
--
io.write("Enter your name: ")
local name = io.read()
io.write("Hello, ", name, "!\n")
