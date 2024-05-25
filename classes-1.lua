#!/usr/bin/lua

-- Define the BankAccount class
BankAccount = {
	-- Attributes of the class
	account_number = 0, -- An integer representing the account number
	holder_name = "", -- A string representing the account holder's name
	balance = 0, -- A floating-point number representing the account balance
}

-- Method to deposit money into the account
function BankAccount:deposit(amount)
	-- Increase the balance by the given amount
	self.balance = self.balance + amount
end

-- Method to withdraw money from the account
function BankAccount:withdraw(amount)
	-- Decrease the balance by the given amount
	self.balance = self.balance - amount
end

-- Constructor to create a new BankAccount object
function BankAccount:new(table)
	table = table or {} -- Create a new table if none is provided
	setmetatable(table, self) -- Set the metatable to allow method calls
	self.__index = self -- Set self as the index for method lookup
	return table
end

-- Create an instance of BankAccount for John
local johns_account = BankAccount:new({
	account_number = 1,
	holder_name = "John",
	balance = 0.0,
})

-- Print the initial balance of John's account
print("New account object ...")
print(johns_account.balance)

-- Deposit $400.00 into John's account
johns_account:deposit(400.00)

-- Print the updated balance of John's account
print("New account object ...")
print(johns_account.balance)
