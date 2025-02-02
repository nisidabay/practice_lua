#!/usr/sbin/lua
--[[ 
In this Kata, you will write a function that receives three strings a, b, c
and return the following:

- If a is a palindrome, return true or false otherwise.
- The string b with alternated case; character at index 1 will be lowercase,
followed by upper, and so on.
- The number of vowels in string c. Vowels are one of "aeiou".
- The length of all three strings combined.

You will need to use several string methods to solve this.

The result looks like this, separated by one space:
solve("aulua","codewars","amanac") = "true cOdEwArS 3 19"
]]

-- Function to check if a string is a palindrome
-- @param str: The input string to check
-- @return: true if the string is a palindrome, false otherwise
local function is_palindrome(str)
	return str == string.reverse(str)
end

-- Function to alternate the case of characters in a string
-- @param str: The input string to modify
-- @return: A new string with alternating case characters
local function alternate_case(str)
	local result = {}
	for i = 1, #str do
		if i % 2 == 0 then
			result[i] = string.upper(string.sub(str, i, i))
		else
			result[i] = string.lower(string.sub(str, i, i))
		end
	end
	return table.concat(result)
end

-- Function to count the number of vowels in a string
-- @param str: The input string to check
-- @return: The number of vowels in the string
local function count_vowels(str)
	local count = 0
	for i = 1, #str do
		if string.match(string.sub(str, i, i), "[aeiou]") then
			count = count + 1
		end
	end
	return count
end

-- Function to get the length of a string
-- @param str: The input string
-- @return: The length of the string
local function length(str)
	return #str
end

-- Main function to solve the problem
-- @param str1: The first input string
-- @param str2: The second input string
-- @param str3: The third input string
-- @return: A formatted string with the results
local function solve(str1, str2, str3)
	local palindrome_result = is_palindrome(str1)
	local alternate_case_result = alternate_case(str2)
	local vowel_count = count_vowels(str3)
	local total_length = length(str1) + length(str2) + length(str3)

	return string.format("%s %s %d %d", tostring(palindrome_result), alternate_case_result, vowel_count, total_length)
end

-- Example function call
print(solve("aulua", "codewars", "amanac"))
