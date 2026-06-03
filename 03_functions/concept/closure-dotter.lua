#!/usr/bin/env lua
-- Closure that appends dots: MakeDotter(n) returns function(s) -> s.."..."

local function MakeDotter(n)
    local dots = string.rep(".", n)
    return function(str)
        return str .. dots
    end
end

local dot3 = MakeDotter(3)
print(dot3("Hello"))      --> Hello...
print(dot3("World"))      --> World...

local dot5 = MakeDotter(5)
print(dot5("Wow"))        --> Wow.....
