vim.g.mapleader = ","

local keymap = vim.keymap
vim.g.user_emmet_leader_key = ","
-- general keymaps
-- keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- splits
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>o", ":NvimTreeFindFile<CR>")

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>")
-- keymap.set("n", "<C-h>", "<cmd>Telescope help_tags<CR>")

-- git
keymap.set("n", "<leader>gv", ":on<CR> :Gvdiffsplit<CR>")
keymap.set("n", "<leader>gw", ":Gwrite<CR> :Git<CR>")
keymap.set(
	"n",
	"<leader>w",
	":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
	{ noremap = true }
)
keymap.set(
	"n",
	"<leader>nw",
	":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	{ noremap = true }
)

keymap.set("n", "<leader>e", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>")

keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
keymap.set("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>")
keymap.set("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>")
keymap.set("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>")
keymap.set("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>")
keymap.set("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>")

-- TESTING
keymap.set("n", "<leader>tf", ":TestFile<CR>")
keymap.set("n", "<leader>tn", ":TestNearest<CR>")
keymap.set("n", "<leader>tl", ":TestLast<CR>")
keymap.set("n", "<leader>ts", ":TestSuite<CR>")
keymap.set("n", "<leader>tv", ":TestVisit<CR>")
