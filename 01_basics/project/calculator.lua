#!/usr/bin/env lua
-- calculator.lua -- Simple REPL calculator.

print("=== Lua Calculator ===")
print("Type: number operator number  (e.g., 5 + 3)")
while true do
    io.write("> "); local input = io.read()
    if input == "quit" then break end
    local a, op, b = input:match("(%S+)%s*([%+%-%*/])%s*(%S+)")
    if a and b then
        a, b = tonumber(a), tonumber(b)
        if op == "+" then print(a + b)
        elseif op == "-" then print(a - b)
        elseif op == "*" then print(a * b)
        elseif op == "/" then print(a / b) end
    else print("Format: 5 + 3") end
end
