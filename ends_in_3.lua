#!/usr/bin/env lua
--
-- Returns true if the string representation of a number ends in "3".
--
-- @param num The input to be checked. It should be a number.
-- @return boolean|string Returns true if the number ends in "3", false if it does not,
--                        and an error message if the input is not a number.
<<<<<<< HEAD
=======
    local num_str = tostring(num)
    local tail = string.sub(num_str, -1, -1)
    if tail == "3" then
        return true
    else
        return false
    end
>>>>>>> Snippet

    local num_str = tostring(num)
    local tail = string.sub(num_str, -1, -1)
    if tail == "3" then
        return true
    else
        return false
    end
end

-- Usage examples:
-- Should print true because 23453 ends in 3
print(ends_in_3(23453))

-- Should print "That's not a number!" because the input is not a number
print(ends_in_3("aaa"))
