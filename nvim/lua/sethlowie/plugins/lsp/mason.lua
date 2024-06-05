return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			tsserver = {},
			html = {},
			cssls = {},
			svelte = {},
			lua_ls = {},
			graphql = {},
			emmet_ls = {},
			prismals = {},
			pyright = {},
			prettier = {},
			stylua = {},
			isort = {},
			black = {},
			pylint = {},
			eslint_d = {},
			tailwindcss = {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
								{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								{ "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							},
						},
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers or {})

		mason_tool_installer.setup({
			ensure_installed = ensure_installed,
		})

		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		mason_lspconfig.setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
