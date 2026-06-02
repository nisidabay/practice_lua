#!/usr/bin/env lua
--
-- Book management system
-- Load lunajson library
-- Load lunajson library
local json = require("lunajson") -- Ensure lunajson is installed and available

-- Global variable to store books
local books = {}
local DATA_FILE = "books.json"

-- Helper function to trim newlines from strings
local function trimNewline(str)
    return str:gsub("\n", "")
end

-- Save books to file
local function saveBooksToFile()
    local file = io.open(DATA_FILE, "w")
    if file then
        -- Encode Lua table into JSON
        file:write(json.encode(books))
        file:close()
    else
        print("Error: Unable to save books to file.")
    end
end

-- Add a new book
local function addBook()
    print("Enter title:")
    local title = trimNewline(io.read())

    print("Enter category:")
    local category = trimNewline(io.read())

    print("Enter author:")
    local author = trimNewline(io.read())

    print("Enter topic:")
    local topic = trimNewline(io.read())

    print("Enter rating (1-5):")
    local rating = tonumber(io.read())
    if not rating or rating < 1 or rating > 5 then
        print("Invalid rating. Setting to 0.")
        rating = 0
    end

    print("Enter comment:")
    local comment = trimNewline(io.read())

    -- Create a new book entry
    local newBook = {
        title = title,
        category = category,
        author = author,
        topic = topic,
        rating = rating,
        comment = comment
    }

    -- Add the book to the global table
    table.insert(books, newBook)

    -- Save to file
    saveBooksToFile()
    print("Book added successfully.")
end

-- Load books from file
local function loadBooksFromFile()
    local file = io.open(DATA_FILE, "r")
    if file then
        local content = file:read("*a")
        file:close()
        -- Decode JSON into a Lua table
        books = json.decode(content) or {}
    else
        print("There is no data file. Adding books")
        addBook()
    end
end

-- Helper function to find books by partial title match
local function findBooksByTitle(searchTitle)
    searchTitle = searchTitle:lower()
    local matches = {}
    for _, book in ipairs(books) do
        if book.title:lower():find(searchTitle) then
            table.insert(matches, book)
        end
    end
    return matches
end

-- Edit a book by partial title match
local function editBook()
    print("Enter part of the title to edit:")
    local searchTitle = trimNewline(io.read())

    -- Find matching books
    local matches = findBooksByTitle(searchTitle)

    if #matches == 0 then
        print("No matching book found.")
        return
    elseif #matches > 1 then
        print("Multiple matches found. Please refine your search.")
        return
    end

    -- Only one match found
    local found = matches[1]
    print("Editing:", found.title)

    print("New title [" .. found.title .. "]:")
    local newTitle = trimNewline(io.read())
    if newTitle ~= "" then
        found.title = newTitle
    end

    print("New category [" .. found.category .. "]:")
    local newCategory = trimNewline(io.read())
    if newCategory ~= "" then
        found.category = newCategory
    end

    print("New author [" .. found.author .. "]:")
    local newAuthor = trimNewline(io.read())
    if newAuthor ~= "" then
        found.author = newAuthor
    end

    print("New topic [" .. found.topic .. "]:")
    local newTopic = trimNewline(io.read())
    if newTopic ~= "" then
        found.topic = newTopic
    end

    print("New rating (1-5) [" .. found.rating .. "]:")
    local newRating = tonumber(io.read())
    if newRating and newRating >= 1 and newRating <= 5 then
        found.rating = newRating
    elseif newRating then
        print("Invalid rating. Value unchanged.")
    end

    print("New comment [" .. found.comment .. "]:")
    local newComment = trimNewline(io.read())
    if newComment ~= "" then
        found.comment = newComment
    end

    -- Save changes to file
    saveBooksToFile()
    print("Book updated successfully.")
end

-- Delete a book by partial title match
local function deleteBook()
    print("Enter part of the title to delete:")
    local searchTitle = trimNewline(io.read())

    -- Find matching books
    local matches = findBooksByTitle(searchTitle)

    if #matches == 0 then
        print("No matching book found.")
        return
    elseif #matches > 1 then
        print("Multiple matches found. Please refine your search.")
        return
    end

    -- Only one match found
    local found = matches[1]

    -- Remove the book from the list
    for i, book in ipairs(books) do
        if book == found then
            table.remove(books, i)
            break
        end
    end

    -- Save changes to file
    saveBooksToFile()
    print("Book deleted successfully.")
end

-- Search for books by partial title match
local function searchBook()
    print("Enter part of the title to search:")
    local searchTitle = trimNewline(io.read())

    -- Find matching books
    local matches = findBooksByTitle(searchTitle)

    if #matches == 0 then
        print("No matching books found.")
    else
        print("\n" .. #matches .. " book(s) found.")
        for _, book in ipairs(matches) do
            print("\nTitle:", book.title)
            print("Category:", book.category)
            print("Author:", book.author)
            print("Topic:", book.topic)
            print("Rating:", book.rating)
            print("Comment:", book.comment)
        end
    end
end

-- List all books in "label" format
local function listBooks()
    if #books == 0 then
        print("No books found.")
        return
    end

    print("\nListing all books:")
    for i, book in ipairs(books) do
        print("\nBook #" .. i .. ":")
        print("  Title   :", book.title)
        print("  Category:", book.category)
        print("  Author  :", book.author)
        print("  Topic   :", book.topic)
        print("  Rating  :", book.rating)
        print("  Comment :", book.comment)
    end
end

-- Main menu
local function mainMenu()
    loadBooksFromFile()

    while true do
        print("\nBook Management System")
        print("1. Add Book")
        print("2. Edit Book")
        print("3. Delete Book")
        print("4. Search Book")
        print("5. List Books")
        print("6. Exit")
        print("Enter your choice:")
        local choice = tonumber(io.read())

        if choice == 1 then
            addBook()
        elseif choice == 2 then
            editBook()
        elseif choice == 3 then
            deleteBook()
        elseif choice == 4 then
            searchBook()
        elseif choice == 5 then
            listBooks()
        elseif choice == 6 then
            print("Exiting program.")
            break
        else
            print("Invalid choice. Please try again.")
        end
    end
end

-- Start the program
mainMenu()
