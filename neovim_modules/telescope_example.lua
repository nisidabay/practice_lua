-- notes.lua: A practical Telescope-based notes manager
-- This module provides functions to create, find, and manage markdown notes

local M = {}

-- Dependencies
local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local previewers = require("telescope.previewers")

-- Configuration with sensible defaults
M.config = {
	-- Where to store notes
	notes_dir = vim.fn.expand("~/notes"),
	-- Default extension for new notes
	extension = ".md",
	-- Default template for new notes
	template = "# %s\n\nCreated: %s\n\n",
}

-- Setup function
function M.setup(opts)
	-- Merge user config with defaults
	if opts then
		M.config = vim.tbl_deep_extend("force", M.config, opts)
	end

	-- Create the notes directory if it doesn't exist
	if vim.fn.isdirectory(M.config.notes_dir) == 0 then
		vim.fn.mkdir(M.config.notes_dir, "p")
	end

	-- Register the extension with telescope
	telescope.register_extension({
		exports = {
			notes = M.find_notes,
			new_note = M.new_note,
			search_notes = M.search_notes,
		},
	})
end

-- Helper function to create a new note
function M.create_note(title)
	local filename = title:gsub(" ", "_"):lower() .. M.config.extension
	local path = M.config.notes_dir .. "/" .. filename

	-- Check if file already exists
	if vim.fn.filereadable(path) == 1 then
		vim.notify("Note '" .. title .. "' already exists!", vim.log.levels.WARN)
		--NOTE: Why edit it?
		vim.cmd("edit " .. path)
		return
	end

	-- Create the note with our template
	local date = os.date("%Y-%m-%d %H:%M:%S")
	local content = string.format(M.config.template, title, date)

	-- Write the initial content to the file
	local file = io.open(path, "w")
	if file then
		file:write(content)
		file:close()

		-- Open the new note in the editor
		vim.cmd("edit " .. path)

		-- Move cursor to the end of the file
		vim.cmd("normal! G")
	else
		vim.notify("Failed to create note '" .. title .. "'", vim.log.levels.ERROR)
	end
end

-- Function to prompt for a new note title
function M.new_note()
	vim.ui.input({ prompt = "Enter note title: " }, function(title)
		if title and title ~= "" then
			M.create_note(title)
		end
	end)
end

-- Function to find and open existing notes
function M.find_notes()
	local find_command = { "find", M.config.notes_dir, "-type", "f", "-name", "*" .. M.config.extension }

	pickers.new({}, {
			prompt_title = "Find Notes",
			finder = finders.new_oneshot_job(find_command),
			sorter = sorters.get_fuzzy_file(),
			previewer = previewers.new_buffer_previewer({
				title = "Note Preview",
				define_preview = function(self, entry, status)
					-- Read file and set content in previewer
					local lines = vim.fn.readfile(entry.value)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
					-- Set filetype for markdown highlighting
					vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "markdown")
				end,
			}),
			attach_mappings = function(prompt_bufnr, map)
				-- Add a custom action to delete notes
				map("i", "<C-d>", function()
					local selection = action_state.get_selected_entry()
					if selection then
						local filename = selection.value
						actions.close(prompt_bufnr)

						-- Confirm deletion
						vim.ui.select(
							{ "Yes", "No" },
							{ prompt = "Delete note '" .. vim.fn.fnamemodify(filename, ":t") .. "'?" },
							function(choice)
								if choice == "Yes" then
									vim.fn.delete(filename)
									vim.notify("Note deleted", vim.log.levels.INFO)
									-- Refresh the view
									M.find_notes()
								end
							end
						)
					end
				end)

				-- Default action is to open the note
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd("edit " .. selection.value)
				end)

				return true
			end,
		})
		:find()
end

-- Function to search content within notes
function M.search_notes()
	pickers.new({}, {
			prompt_title = "Search Notes",
			finder = finders.new_oneshot_job({
				"grep",
				"-r",
				"--include=*" .. M.config.extension,
				"-l",
				".",
				M.config.notes_dir,
			}),
			sorter = sorters.get_fuzzy_file(),
			previewer = conf.grep_previewer({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.cmd("edit " .. selection.value)
				end)
				return true
			end,
		})
		:find()
end

-- Return the module table
return M

-- require('notes').setup({
--   notes_dir = vim.fn.expand("~/notes"),
--   extension = ".md",
--   template = "# %s\n\nCreated: %s\nTags: \n\n"
-- })
--
-- -- 5. Load the extension
-- require('telescope').load_extension('notes')
--
-- -- 6. Add keybindings
-- vim.keymap.set('n', '<leader>nn', '<cmd>Telescope notes new_note<CR>')
-- vim.keymap.set('n', '<leader>nf', '<cmd>Telescope notes<CR>')
-- vim.keymap.set('n', '<leader>ns', '<cmd>Telescope notes search_notes<CR>')
--
--
--
