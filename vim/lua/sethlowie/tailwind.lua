local util = require'lspconfig/util'

require'lspconfig'.tailwindcss.setup{
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "elm" },
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        elm = "html",
        eruby = "erb"
      }
    },
    on_new_config = function(new_config)
          if not new_config.settings then
            new_config.settings = {}
          end
          if not new_config.settings.editor then
            new_config.settings.editor = {}
          end
          if not new_config.settings.editor.tabSize then
            -- set tab size for hover
            new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
          end
        end,
    root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
    settings = {
      tailwindCSS = {
        classAttributes = { "class", "className", "classList", "ngClass" },
        experimental = {
          classRegex = {"\\bclass\\s+\"([^\"]*)\"", "\\btw\\(+\"([^\"]*)\""}
          -- classRegex = {"\\b(className\\=\\%tw\\(\)+\"([^\"]*)\""}
        },
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

-- require'lspconfig'.tailwindcss.setup{
--     cmd = { "tailwindcss-language-server", "--stdio" },
--     filetypes = {"html", "elm", "rescript", "typescriptreact"},
--     init_options = {
--       userLanguages = {
--         elm = "html"
--       }
--     },
--     on_attach = require("compe").on_attach,
--     handlers = {
--       ["tailwindcss/getConfiguration"] = function (_, _, params, _, bufnr, _)
--         -- tailwindcss lang server waits for this repsonse before providing hover
--         vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
--       end
--     },
--     settings = {
--      tailwindCSS = {
--        classAttributes = { 'class' , 'className' , 'classList' },
--        -- headwind = {
--        --   sortTailwindClasses = true
--        -- },
--        -- experimental = {
--          -- classRegex = {"\\bclass\\s+\"([^\"]*)\""}
--          -- classRegex = {"\\bclassName\\=+\"([^\"]*)\""},
--          -- classRegex = {"\\b(class\\s|className\\=|className\\=\\%\\()\\s+\"([^\"]*)\""}
--          -- classRegex = {"\\b(class\\s|className\\=|className\\=\\%tw\\()+\"([^\"]*)\""}
--        -- },
--        -- htmlLanguages = {"elm"},
--        lint = {
--          cssConflict = "warning",
--          invalidApply = "error",
--          invalidConfigPath = "error",
--          invalidScreen = "error",
--          invalidTailwindDirective = "error",
--          invalidVariant = "error",
--          recommendedVariantOrder = "warning"
--        },
--        validate = true
--      },
--   }
-- }
