#!/usr/bin/env lua
-- Bonus Exercise: IP extractor from log line
--
-- Instructions: Parse the Apache-style log line using string.match (or :match).
-- Extract:
--   1. The IP address (starts the line: xxx.xxx.xxx.xxx)
--   2. The HTTP method and path (inside double quotes, before "HTTP")
--   3. The HTTP status code (3-digit number after the closing quote)
--   4. The timestamp (inside square brackets)

local log = [[192.168.1.1 - - [03/Jun/2026:10:00:00 +0000] "GET /index.html HTTP/1.1" 200 2326]]

-- TODO: Extract fields from the log line using pattern matching
local ip = nil
local method = nil
local path = nil
local status = nil
local timestamp = nil

-- Verification (DO NOT MODIFY)
if ip and method and path and status and timestamp then
  print(string.format("IP: %s | Method: %s %s | Status: %s | Time: %s", ip, method, path, status, timestamp))
else
  print("Log parsing failed — one or more fields are nil")
end
-- Solution: see exercises.lua
