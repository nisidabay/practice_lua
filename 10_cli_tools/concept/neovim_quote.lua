#!/usr/sbin/lua
--
-- Function to get a random Neovim quote
local function get_random_quote()
	local quotes = {
		"Neovim: it's not just an editor, it's a way of life",
		"The only limit in Neovim is your imagination",
		"Efficiency is doing things right; Neovim is doing the right things",
		"One Neovim to rule them all",
		"Neovim: where productivity meets extensibility",
		"Don't optimize the editor, let the editor optimize you",
		"Modal editing: because life's too short for reaching for the mouse",
		"Neovim: escape from mediocrity, enter excellence",
		"Yesterday I couldn't spell 'vim', today I'm a Neovim power user",
		"In Neovim we trust",
	}
	-- Get a random quote based on the current date to ensure consistency within a day
	local day = os.date("%j") -- Day of the year
	math.randomseed(tonumber(day))
	return quotes[math.random(#quotes)]
end

print(get_random_quote())
