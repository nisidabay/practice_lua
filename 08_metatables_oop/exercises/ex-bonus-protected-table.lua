#!/usr/bin/env lua
-- Bonus Exercise: Protected table with __newindex guard
--
-- Instructions: Create a metatable with __newindex that blocks writes to
-- keys starting with "_" (print "Blocked write to private: <key>") but
-- allows writes to other keys. Use rawset for allowed writes.

-- TODO: Create a metatable with __index (pointing to a protected table)
--       and __newindex that guards against "_"-prefixed keys
-- TODO: Test by setting data.name = "public" and data._secret = "private"

-- Verification (DO NOT MODIFY)
-- Expected: data.name = public, data._secret = nil (or blocked message)
-- Solution: see exercises.lua
