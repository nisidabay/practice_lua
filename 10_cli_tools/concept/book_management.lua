#!/usr/bin/env lua
-- Book CLI: add/list/search via pattern-based JSON. Usage: lua book_management.lua add "Title" "Author" YEAR

local D = "/tmp/books.json"
local books = {}

local function load()
    local f = io.open(D, "r")
    if f then
        for line in f:lines() do
            local t, a, y = line:match('"title":"([^"]+)","author":"([^"]+)","year":(%d+)')
            if t then table.insert(books, {title=t, author=a, year=tonumber(y)}) end
        end
        f:close()
    end
end

local function save()
    local f = io.open(D, "w")
    for _, b in ipairs(books) do
        f:write(string.format('{"title":"%s","author":"%s","year":%d}\n', b.title, b.author, b.year))
    end
    f:close()
end

local cmd = arg[1]
load()

if cmd == "add" and arg[2] and arg[3] and arg[4] then
    table.insert(books, {title=arg[2], author=arg[3], year=tonumber(arg[4])})
    save()
    print("Added:", arg[2])
elseif cmd == "list" then
    for i, b in ipairs(books) do
        print(string.format("%d. %s by %s (%d)", i, b.title, b.author, b.year))
    end
elseif cmd == "search" and arg[2] then
    for i, b in ipairs(books) do
        if b.title:lower():find(arg[2]:lower()) or b.author:lower():find(arg[2]:lower()) then
            print(string.format("%d. %s by %s (%d)", i, b.title, b.author, b.year))
        end
    end
else
    print("Usage:")
    print("  lua book_management.lua add <title> <author> <year>")
    print("  lua book_management.lua list")
    print("  lua book_management.lua search <term>")
end
