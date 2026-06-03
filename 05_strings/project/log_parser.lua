#!/usr/bin/env lua
-- log_parser.lua — Parse Apache-style combined log lines
-- Usage: lua log_parser.lua [logfile]  (default: sample data)

local sample_logs = {
    '192.168.1.1 - - [03/Jun/2026:10:00:01 +0000] "GET /index.html HTTP/1.1" 200 2326',
    '10.0.0.5 - admin [03/Jun/2026:10:00:02 +0000] "POST /login HTTP/1.1" 302 512',
    '192.168.1.1 - - [03/Jun/2026:10:00:03 +0000] "GET /style.css HTTP/1.1" 200 1042',
    '10.0.0.5 - admin [03/Jun/2026:10:00:04 +0000] "GET /dashboard HTTP/1.1" 200 4512',
    '172.16.0.1 - - [03/Jun/2026:10:00:05 +0000] "GET /api/data HTTP/1.1" 500 98',
    '192.168.1.1 - - [03/Jun/2026:10:00:06 +0000] "DELETE /admin/user/5 HTTP/1.1" 403 45',
    '10.0.0.5 - admin [03/Jun/2026:10:00:07 +0000] "POST /api/upload HTTP/1.1" 201 876',
}

local function parse_line(line)
    local ip = line:match("^(%S+)")
    local user = line:match("^%S+%s+%S+%s+(%S+)")
    local timestamp = line:match("%[(.-)%]")
    local method, path = line:match('"(%a+)%s+([^%s]+)')
    local status, size = line:match("(%d%d%d)%s+(%d+)$")
    return {
        ip = ip,
        user = (user == "-") and "anonymous" or user,
        timestamp = timestamp,
        method = method,
        path = path,
        status = tonumber(status),
        size = tonumber(size),
    }
end

local lines = {}
if arg and arg[1] then
    for line in io.lines(arg[1]) do lines[#lines + 1] = line end
else
    lines = sample_logs
end

print("=== Log Parser Report ===")
print(string.format("%-15s %-12s %-8s %8s %s", "IP", "USER", "STATUS", "SIZE", "PATH"))
print(string.rep("-", 65))

local totals = {lines = 0, bytes = 0, statuses = {}, ips = {}, methods = {}}
for _, line in ipairs(lines) do
    local e = parse_line(line)
    if e.ip then
        print(string.format("%-15s %-12s %-8d %8d %s",
            e.ip, e.user, e.status, e.size, e.path))
        totals.lines = totals.lines + 1
        totals.bytes = totals.bytes + e.size
        totals.statuses[e.status] = (totals.statuses[e.status] or 0) + 1
        totals.ips[e.ip] = (totals.ips[e.ip] or 0) + 1
        totals.methods[e.method] = (totals.methods[e.method] or 0) + 1
    end
end

print(string.rep("-", 65))
print(string.format("Total: %d requests, %d bytes", totals.lines, totals.bytes))

print("\n--- Status codes ---")
for code, count in pairs(totals.statuses) do
    local names = {[200]="OK", [201]="Created", [302]="Found", [403]="Forbidden", [500]="Error"}
    print(string.format("  %d %s: %d", code, names[code] or "Unknown", count))
end

print("\n--- Top IPs ---")
local ips_sorted = {}
for ip, count in pairs(totals.ips) do ips_sorted[#ips_sorted + 1] = {ip = ip, count = count} end
table.sort(ips_sorted, function(a, b) return a.count > b.count end)
for _, entry in ipairs(ips_sorted) do
    print(string.format("  %s: %d requests", entry.ip, entry.count))
end

print("\n--- Methods ---")
for method, count in pairs(totals.methods) do
    print(string.format("  %s: %d", method, count))
end
