return {
	{
		"shaunsingh/nord.nvim",
		-- "olimorris/onedarkpro.nvim",
		config = function()
			vim.cmd.colorscheme("nord")
			-- vim.cmd("colorscheme onedark")
			-- Correctly set background of Normal and NonText highlight groups to none for GUI and terminal
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "nord",
          -- section_separators = { "", "" },
          -- component_separators = { "", "" },
        },
      })
    end
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
