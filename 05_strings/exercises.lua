#!/usr/bin/env lua
-- exercises.lua — Strings & pattern matching. Run: lua exercises.lua

print("=== Ex 1: Concatenation and length ===")
local a, b = "Hello", "World"
local msg = a .. ", " .. b .. "!"
print("msg:", msg)
print("length:", #msg)
print()

print("=== Ex 2: string.find ===")
local text = "the quick brown fox"
local start, finish = text:find("quick")
print(string.format("'quick' found at positions %d-%d", start, finish))
print("'zebra' found?", text:find("zebra") ~= nil)
print()

print("=== Ex 3: string.sub ===")
print("first 3 chars:", text:sub(1, 3))
print("last 3 chars:", text:sub(-3))
print()

print("=== Ex 4: string.gsub ===")
local numbers = "call 555-1234 or 555-5678"
local masked = numbers:gsub("%d", "X")
print("masked:", masked)
local swapped = ("one two three"):gsub("(%a+)", "[%1]")
print("bracketed:", swapped)
print()

print("=== Ex 5: string.gmatch ===")
local words = {}
for w in text:gmatch("%a+") do words[#words + 1] = w end
print("Words in text:", table.concat(words, " | "))
print()

print("=== Ex 6: string.format ===")
print(string.format("Pi: %.4f", math.pi))
print(string.format("Hex: %x, Octal: %o", 255, 255))
print()

print("=== Ex 7: Character classes ===")
local data = "Temp: 23.5C, Humidity: 67%, Wind: 12km/h"
local numbers = {}
for n in data:gmatch("%d+%.?%d*") do numbers[#numbers + 1] = n end
print("Extracted numbers:", table.concat(numbers, ", "))
print()

print("=== BONUS: IP extractor from log line ===\n")
local log = [[192.168.1.1 - - [03/Jun/2026:10:00:00 +0000] "GET /index.html HTTP/1.1" 200 2326]]
print("Log:", log)
local ip = log:match("^(%d+%.%d+%.%d+%.%d+)")
local method, path = log:match('"(%a+) ([^"]-) HTTP')
local status = log:match('" (%d+) ')
local timestamp = log:match("%[(.-)%]")
print(string.format("IP: %s | Method: %s %s | Status: %s | Time: %s", ip, method, path, status, timestamp))
