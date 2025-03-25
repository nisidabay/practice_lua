#!/usr/sbin/luajit
-- The bit library is avaiable in luajit
-- Bits operations
local bits = require("bit")

-- local function to flip bits at specified positions
local function flip_bits(num, mask)
	return bits.bxor(num, mask)
end

-- local function to swap two variables without a temporary variable
local function swap(a, b)
	a = bits.bxor(a, b)
	b = bits.bxor(a, b)
	a = bits.bxor(a, b)
	return a, b
end

-- local function to check if two integers have opposite signs
local function have_opposite_signs(x, y)
	return (bits.bxor(x, y) < 0)
end

-- local function for simple XOR encryption and decryption
local function xor_encrypt_decrypt(data, key)
	local result = {}
	for i = 1, #data do
		local char = string.byte(data, i)
		table.insert(result, string.char(bits.bxor(char, key)))
	end
	return table.concat(result)
end

-- local function to detect changes in data using XOR
local function detect_changes(old_data, new_data)
	return bits.bxor(old_data, new_data)
end

-- local function to calculate parity (odd or even number of 1 bits)
local function calculate_parity(num)
	local parity = 0
	while num > 0 do
		parity = bits.bxor(parity, bits.band(num, 1))
		num = bits.rshift(num, 1)
	end
	return parity
end

-- local function to find the missing number in a sequence 0 to n
local function find_missing_number(arr, n)
	local xor_all = 0
	local xor_arr = 0

	for i = 0, n do
		xor_all = bits.bxor(xor_all, i)
	end

	for i = 1, n do
		xor_arr = bits.bxor(xor_arr, arr[i])
	end

	return bits.bxor(xor_all, xor_arr)
end

-- local function to find the unique element in an array where all elements appear
-- twice except one
local function find_unique_element(arr)
	local result = 0
	for i = 1, #arr do
		result = bits.bxor(result, arr[i])
	end
	return result
end

-- Demonstrating the local functions

-- Flipping bits
local num = 29 -- Binary: 11101
local mask = 6 -- Binary: 00110
print("Original number: " .. num .. " After flipping bits: " .. flip_bits(num, mask))

-- Swapping variables
local a, b = 5, 7
print("Before swap: a =", a, "b =", b)
a, b = swap(a, b)
print("After swap: a =", a, "b =", b)

-- Checking for opposite signs
local x, y = -10, 15
print(x, "and", y, "have opposite signs:", have_opposite_signs(x, y) and "Yes" or "No")

-- XOR encryption/decryption
local data = "Hello, XOR!"
local key = string.byte("K")
print("Original data:", data)
data = xor_encrypt_decrypt(data, key)
print("Encrypted data:", data)
data = xor_encrypt_decrypt(data, key)
print("Decrypted data:", data)

-- Detecting changes in data
local old_data = 0b110011
local new_data = 0b111001
print("Changes detected:", detect_changes(old_data, new_data))

-- Calculating parity
local parity_num = 29 -- Binary: 11101
print("Parity of", parity_num, "is:", calculate_parity(parity_num) == 1 and "Odd" or "Even")

-- Finding missing number in a sequence
local sequence = { 0, 1, 2, 4 }
print("Missing number is:", find_missing_number(sequence, 4))

-- Finding unique element in an array
local array = { 1, 2, 3, 2, 1 }
print("Unique element is:", find_unique_element(array))
