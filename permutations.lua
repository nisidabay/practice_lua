#!/usr/sbin/lua
--
-- Create a function to find permutations in a string
local function find_permutations(input_string)
    local function generate_permutations(current_character, remaining_characters, collected_permutations)
        if #remaining_characters == 0 then
            table.insert(collected_permutations, current_character)
        else
            for i = 1, #remaining_characters do
                local new_string = current_character .. remaining_characters:sub(i, i)
                print("new_string: ", new_string)
                local new_remaining = remaining_characters:sub(1, i - 1) .. remaining_characters:sub(i + 1)
                print("new_remaining: ", new_remaining)
                generate_permutations(new_string, new_remaining, collected_permutations)
            end
        end
    end

    local permutations_list = {}
    generate_permutations("", input_string, permutations_list)
    return permutations_list
end

-- Example usage
local permutations = find_permutations("abc")
for _, permutation in pairs(permutations) do
    print(permutation)
end

