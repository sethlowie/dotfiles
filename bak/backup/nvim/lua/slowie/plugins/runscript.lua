function run_script()
	-- Get the current file name
	local current_file = vim.fn.expand("%:t")

	-- Get the directory containing the current file
	local current_dir = vim.fn.expand("%:p:h")

	-- Construct the command
	local command = "cd " .. current_dir .. " && pnpm scripts " .. current_file

	-- Get the maximum possible height of a window in the current Neovim instance
	local max_height = vim.o.lines - vim.o.cmdheight - 2 -- Adjusting for command line and status line

	-- Create a new terminal window with a command, and set it to the maximum height
	vim.cmd(max_height .. "new | term " .. command) -- This creates a new split with the maximum height

	-- Wait for the terminal to be fully open and ready
	vim.cmd("sleep 50m") -- Sleep for 50 milliseconds. You can adjust this as needed.

	-- Now, we will force the cursor to move to the end of the file to "tail" the output.
	-- This command is equivalent to pressing 'G' in normal mode, which takes you to the end of the file.
	vim.cmd("startinsert")

	-- Optionally, you can send a command to the terminal to keep it open after the script finishes.
end

vim.cmd("command! RunScript lua run_script()")

vim.api.nvim_set_keymap("n", "<leader>rs", ":RunScript<CR>", { noremap = true, silent = true })

-- Don't let Esc close the terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
