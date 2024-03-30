local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then
	return
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then
	return
end

local rust_tools_setup, rust_tools = pcall(require, "rust-tools")
if not rust_tools_setup then
	return
end

local keymap = vim.keymap

keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Hover actions
	-- keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	-- keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
	-- set keymaps
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "<leader>u", "<cmd>LSoutlineToggle<CR>", opts)

	local active_clients = vim.lsp.get_active_clients()
	if client.name == "denols" then
		for _, client_ in pairs(active_clients) do
			-- stop tsserver if denols is already active
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
		for _, client_ in pairs(active_clients) do
			-- prevent tsserver from starting if denols is already active
			if client_.name == "denols" then
				client.stop()
			end
		end
	end
end

local cmd = vim.cmd
cmd("autocmd BufWritePre *.elm lua vim.lsp.buf.format(nil, 100)")
cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.format(nil, 100)")

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

local function is_package_json_present()
	local file = io.open("package.json", "r")
	if file then
		io.close(file)
		return true
	end
	return false
end

local function ts_root_dir()
	local root_dir = lspconfig.util.root_pattern("package.json")(startpath)
	if root_dir and is_package_json_present() then
		print("dont do this")
		return root_dir
	end
	print("should do this")
	return nil
end

lspconfig["tsserver"].setup({
	root_dir = ts_root_dir,
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["sourcekit"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern(
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
		"package.json",
		"node_modules",
		".git"
	),
	init_options = {
		userLanguages = {
			elm = "html",
			html = "html",
		},
	},
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "classList", "ngClass" },
			experimental = {
				classRegex = {
					'\\bclass[\\s(<|]+"([^"]*)"',
					'\\bclass[\\s(]+"[^"]*"[\\s+]+"([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
				},
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
	filetypes = {
		"haml",
		"handlebars",
		"html",
		"jade",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"elm",
	},
})

lspconfig["elmls"].setup({
	init_options = {
		elmAnalyseTrigger = "change",
		elmFormatPath = "elm-format",
		elmPath = "elm",
		elmTestPath = "elm-test",
	},
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("elm.json", ".git"),
})

-- lspconfig["lua-language-server"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = { -- custom settings for lua
-- 		Lua = {
-- 			-- make the language server recognize "vim" global
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- make language server aware of runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })

lspconfig["denols"].setup({
	root_dir = lspconfig.util.root_pattern("deno.json"),
	init_options = {
		enable = true,
		lint = true,
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

rust_tools.setup({
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})
