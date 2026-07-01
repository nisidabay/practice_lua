#!/usr/bin/env lua
-- Contact list manager — stores, searches, and lists contacts
local contacts = {}

local function save()
    local f = io.open("/tmp/contacts.json", "w")
    for _, c in ipairs(contacts) do
        f:write(string.format('{"name":"%s","email":"%s","phone":"%s"}\n', c.name, c.email, c.phone))
    end
    f:close()
end

local function load()
    local f = io.open("/tmp/contacts.json", "r")
    if not f then return end
    for line in f:lines() do
        local name, email, phone = line:match('"name":"([^"]+)","email":"([^"]+)","phone":"([^"]+)"')
        if name then table.insert(contacts, {name=name, email=email, phone=phone}) end
    end
    f:close()
end

local function add(name, email, phone)
    table.insert(contacts, {name=name, email=email, phone=phone})
end

local function search(query)
    for i, c in ipairs(contacts) do
        if c.name:lower():find(query:lower()) or c.email:lower():find(query:lower()) then
            print(string.format("%d. %s — %s (%s)", i, c.name, c.email, c.phone))
        end
    end
end

local function list()
    for i, c in ipairs(contacts) do
        print(string.format("%d. %s — %s (%s)", i, c.name, c.email, c.phone))
    end
end

-- Demo
add("Alice Garcia", "alice@example.com", "555-0101")
add("Bob Chen", "bob@example.com", "555-0102")
save()
load()
list()
print("--- Search: alice ---")
search("alice")
