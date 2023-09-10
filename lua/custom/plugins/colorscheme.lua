return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
		,
		config = function()
			require("catppuccin").setup {
				transparent_background = true
			}
			vim.cmd.colorscheme "catppuccin"
		end
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require("tokyonight").setup {
			-- 	transparent = true,
			-- 	style = "storm"
			-- }
			-- vim.cmd.colorscheme "tokyonight"
		end
	},


}
