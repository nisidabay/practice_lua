#!/usr/bin/env lua
-- exercises.lua — CLI Tools & error handling. Run: lua exercises.lua

print("=== Ex 1: Arg parsing ===")
local function show_args()
    print(string.format("  Script: %s | #args: %d", arg[0] or "unknown", #arg))
    if #arg > 0 then
        for i, a in ipairs(arg) do print(string.format("  arg[%d] = %s", i, a)) end
    end
end
show_args()
print()

print("=== Ex 2: pcall error handling ===")
local function divide(a, b)
    if b == 0 then error("division by zero") end
    return a / b
end

local ok, result = pcall(divide, 10, 2)
print("  10/2 ok:", ok, "=", result)

ok, err = pcall(divide, 10, 0)
print("  10/0 ok:", ok, "err:", err)
print()

print("=== Ex 3: xpcall with handler ===")
local function handler(err)
    return "[" .. os.date("%H:%M:%S") .. "] " .. err
end

local function risky()
    error("file not found: data.txt")
end

ok, err = xpcall(risky, handler)
print("  xpcall err:", err)
print()

print("=== Ex 4: Config file parsing ===")
local config_str = [[
host=localhost
port=5432
user=admin
debug=true
]]
local config = {}
for line in config_str:gmatch("[^\n]+") do
    local key, val = line:match("^(%w+)%s*=%s*(.+)$")
    if key then config[key] = val end
end
for k, v in pairs(config) do
    print(string.format("  %s = %s", k, v))
end
print()

print("=== Ex 5: Line counter (wc clone) ===")
local function count_lines(text)
    local count = 0
    for _ in text:gmatch("\n") do count = count + 1 end
    return count
end
local sample = "line1\nline2\nline3\n"
print(string.format("  Lines: %d", count_lines(sample)))
print()

print("=== Ex 6: assert usage ===")
local function safe_sqrt(n)
    assert(type(n) == "number", "expected number, got " .. type(n))
    assert(n >= 0, "negative number: " .. n)
    return math.sqrt(n)
end
print("  sqrt(16) =", safe_sqrt(16))
local ok, err = pcall(safe_sqrt, -4)
print("  sqrt(-4):", err)
print()

print("=== BONUS: Shell integration ===\n")
local handle = io.popen("ls -1 " .. (arg[0] and arg[0]:match("^(.*/)") or ".") .. " 2>/dev/null | head -5")
local output = handle:read("*a")
handle:close()
print("  Files in script dir:")
for line in output:gmatch("[^\n]+") do
    print("    " .. line)
end
