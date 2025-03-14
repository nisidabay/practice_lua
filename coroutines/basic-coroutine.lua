#!/usr/sbin/lua
local function myCoroutine()
    print("Coroutine started")
    coroutine.yield()  -- Yield and give up control
    print("Coroutine resumed")
    coroutine.yield()
    print("Coroutine finished")
end

local co = coroutine.create(myCoroutine)

print(coroutine.resume(co))  -- Output: true, Coroutine started
print(coroutine.resume(co))  -- Output: true, Coroutine resumed
print(coroutine.resume(co))  -- Output: true, Coroutine finished
print(coroutine.resume(co))  -- Output: false, cannot resume dead coroutine

