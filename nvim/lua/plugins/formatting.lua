return {
  {
    "mattn/emmet-vim",
    config = function() end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      autotag = { enable = true },
    },
    config = true,
  },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    lazy = false,
    config = function()
      local comment = require("Comment")
      comment.setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {

    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- lua
          null_ls.builtins.formatting.stylua,

          -- typescript
          null_ls.builtins.formatting.prettier,
          require("none-ls.diagnostics.eslint_d"),
        },
      })

      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end,
  },
}
