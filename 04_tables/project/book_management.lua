#!/usr/bin/env lua
local books = {}

local function save()
    local f = io.open("/tmp/books.json", "w")
    for _, b in ipairs(books) do
        f:write(string.format('{"title":"%s","author":"%s","year":%d}\n', b.title, b.author, b.year))
    end
    f:close()
end

local function load()
    local f = io.open("/tmp/books.json", "r")
    if not f then return end
    for line in f:lines() do
        local title, author, year = line:match('"title":"([^"]+)","author":"([^"]+)","year":(%d+)')
        if title then table.insert(books, {title=title, author=author, year=tonumber(year)}) end
    end
    f:close()
end

local function add(title, author, year)
    table.insert(books, {title=title, author=author, year=tonumber(year)})
end

local function list()
    for i, b in ipairs(books) do
        print(string.format("%d. %s by %s (%d)", i, b.title, b.author, b.year))
    end
end

-- Demo
add("The Hobbit", "Tolkien", 1937)
add("Dune", "Herbert", 1965)
save()
load()
list()
