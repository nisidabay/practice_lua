#!/usr/bin/env lua
print("os.date():", os.date("%Y-%m-%d %H:%M:%S"))
print("os.time():", os.time())

local diff = os.difftime(os.time(), os.time({year=2020, month=1, day=1}))
print(string.format("%.0f seconds since 2020-01-01", diff))

local tmp = os.tmpname()
print("tmpname:", tmp)

local ok = os.execute("echo 'shell test' > /dev/null")
print("os.execute:", ok)

os.execute("sleep 0.1")    -- platform sleep
