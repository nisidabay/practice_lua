#!/usr/bin/env lua
local function countOddEven()
    local odd, even = 0, 0
    return function(n)
        if n % 2 == 0 then even = even + 1 else odd = odd + 1 end
        return odd, even
    end
end

local track = countOddEven()
for _, n in ipairs({1, 2, 3, 4, 5, 6}) do
    local o, e = track(n)
    print(n, "-> odd:", o, "even:", e)
end
