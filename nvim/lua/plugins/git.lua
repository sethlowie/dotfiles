return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", {})
    vim.keymap.set("n", "<leader>gv", ":Gvdiffsplit<CR>", {})
    vim.keymap.set("n", "<leader>gw", ":Gwrite<CR> :Git<CR>", {})
  end
}
