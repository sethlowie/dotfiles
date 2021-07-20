local actions = require('telescope.actions')
local nvim_set_keymap = vim.api.nvim_set_keymap

require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '> ',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('git_worktree')

local M = {}
M.search_ide = function()
  require('telescope.builtin').find_files({
    prompt_title = "< Couchbase IDE >",
    cwd = "~/go/src/github.com/sethlowie/couchbase-ide",
  })
end
nvim_set_keymap('n', '<Leader>ide', ':lua require("sethlowie.telescope").search_ide()<CR>', { noremap = true })
nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', { noremap = true })
nvim_set_keymap('n', '<C-g>', '<cmd>Telescope live_grep<CR>', { noremap = true })
nvim_set_keymap('n', '<Leader>w', ':lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', { noremap = true })
nvim_set_keymap('n', '<Leader>nw', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>', { noremap = true })
return M
