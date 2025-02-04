#!/usr/bin/env lua
--
-- Parallel network requests

local http = require("socket.http")

local function fetch_url(url)
    local response, status = http.request(url)
    print("Fetched " .. url .. ": " .. status)
    coroutine.yield()
end

local urls = {
    "https://example.com",
    "https://example.org",
    "https://example.net"
}

local coroutines = {}
for _, url in ipairs(urls) do
    local co = coroutine.create(fetch_url)
    table.insert(coroutines, co)
end

-- Run all coroutines in a round-robin fashion
while true do
    local all_done = true
    for _, co in ipairs(coroutines) do
        if coroutine.status(co) ~= "dead" then
            all_done = false
            coroutine.resume(co, urls[_])
        end
    end
    if all_done then break end
end
