local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

lspconfig.tsserver.setup {
  filetypes = {
    "javascript",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
  end,
  init_options = {
    documentFormatting = false,
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = is_using_eslint,
  },
  -- on_init = custom_on_init,
  root_dir = util.root_pattern("package.json")
}

-- lspconfig.efm.setup {
--   root_dir = util.root_pattern("package.json"),
--   on_attach = function(client)
--     client.resolved_capabilities.rename = false
--     client.resolved_capabilities.hover = false
--     client.resolved_capabilities.document_formatting = true
--     client.resolved_capabilities.completion = false
--   end,
--   init_options = {documentFormatting = true},
--   filetypes = {
--     "javascript",
--     "javascript.jsx",
--     "typescript",
--     "typescript.tsx",
--     "typescriptreact",
--     -- "svelte",
--   },
--   settings = {
--     languages = {
--       javascript = { eslint },
--       typescript = { eslint },
--       ["typescript.tsx"] = { eslint },
--       typescriptreact = { eslint },
--       svelte = { eslint },
--     },
--   },
-- }

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

local saga = require 'lspsaga'

saga.init_lsp_saga()

require'lspconfig'.dartls.setup{}
