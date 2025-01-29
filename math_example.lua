#!/usr/sbin/lua
-- Call the math_utils.lua module

-- load the module
local mathUtils = require("math_utils")
local sum =mathUtils.add(2, 3)
print("Sum:",sum)

local difference= mathUtils.substract(2,3)
print("Substraction:",difference)
