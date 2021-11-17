local use_coc = os.getenv("USE_COC")
local nvim_set_keymap = vim.api.nvim_set_keymap
local opt = vim.opt
local cmd = vim.cmd
local function silentRemap (a, b) 
    local command = b
    if not string.find(b, "<Plug>") then
        command = b .. '<CR>'
    end
    nvim_set_keymap('n', '<Leader>' .. a, command, { noremap = true, silent = true })
end

require("sethlowie.lang")
opt.completeopt = 'menuone,noinsert,noselect'
nvim_set_keymap('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- PREV/NEXT
nvim_set_keymap('n', '<Leader>nn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>NN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

nvim_set_keymap('n', '<Leader>af', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gt', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
nvim_set_keymap('n', '<Leader>gh', ':Lspsaga code_action<CR>', { noremap = true, silent = true })
nvim_set_keymap('i', '<Leader>c', 'compe#complete()', { noremap = true, silent = true, expr = true })


-- TAB COMPLETE
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
