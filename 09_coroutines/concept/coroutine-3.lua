#!/usr/bin/lua
--
-- Function to generate numbers using a coroutine
local function generateNumbers()
    -- Create a coroutine to yield numbers from 1 to 5
    local co = coroutine.create(function()
        for i = 1, 5 do
            coroutine.yield(i)
        end
    end)

    -- Collect yielded numbers in a table
    local yielded_numbers = {}
    while coroutine.status(co) ~= "dead" do
        local _, number = coroutine.resume(co)
        table.insert(yielded_numbers, number)
    end

    return yielded_numbers -- Return the table of yielded numbers
end

-- Main loop to call "generateNumbers" 10 times and print the results
for iteration = 1, 10 do
    local numbers = generateNumbers()
    for _, number in ipairs(numbers) do
        print(string.format("iteration %d: number %d", iteration, number))
    end
end
