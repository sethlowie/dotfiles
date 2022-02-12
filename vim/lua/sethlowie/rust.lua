local g = vim.g

g.rustfmt_autosave = 1
-- require'lspconfig'.rls.setup{
--     settings = {
--     rust = {
--       unstable_features = true,
--       build_on_save = false,
--       all_features = true,
--     },
--   },
-- }

require'lspconfig'.rust_analyzer.setup({})
