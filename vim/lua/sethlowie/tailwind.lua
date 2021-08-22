require'lspconfig'.tailwindcss.setup{
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {"html", "elm"},
    init_options = {
      userLanguages = {
        elm = "html"
      }
    },
    on_attach = require("compe").on_attach,
    handlers = {
      ["tailwindcss/getConfiguration"] = function (_, _, params, _, bufnr, _)
        -- tailwindcss lang server waits for this repsonse before providing hover
        vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
      end
    },
    settings = {
     tailwindCSS = {
       -- headwind = {
       --   sortTailwindClasses = true
       -- },
       experimental = {
         classRegex = {"\\bclass\\s+\"([^\"]*)\""}
       },
       -- htmlLanguages = {"elm"},
       lint = {
         cssConflict = "warning",
         invalidApply = "error",
         invalidConfigPath = "error",
         invalidScreen = "error",
         invalidTailwindDirective = "error",
         invalidVariant = "error",
         recommendedVariantOrder = "warning"
       },
       validate = true
     },
  }
}
