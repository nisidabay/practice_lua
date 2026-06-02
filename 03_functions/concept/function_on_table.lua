#!/usr/sbin/lua
--
-- Define a function on a table
local MyTable = {}

-- Define a function 'something' on 'MyTable' using dot notation
-- This function takes 'self' as the first parameter and additional varargs
-- Dot notation is typically used for static methods
function MyTable.something(self, ...)
	print("Called something with self:", self, "and args:", ...)
end

-- Define a function 'somethingElse' on 'MyTable' using colon notation
-- This function implicitly passes 'self' as the first parameter
-- Colon notation is typically used for instance methods
function MyTable:somethingElse(...)
	print("Called somethingElse with self:", self, "and args:", ...)
end

-- Example usage of the defined functions

-- Create an instance of MyTable
local instance = MyTable

-- Call the 'something' function using dot notation
-- Explicitly pass 'instance' as the first argument
instance.something(instance, "arg1", "arg2")

-- Call the 'somethingElse' function using colon notation
-- 'instance' is implicitly passed as the first argument
instance:somethingElse("arg1", "arg2")
