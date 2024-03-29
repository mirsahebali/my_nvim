return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			color_overrides = {
				mocha = {
					base = "#11111B"

				},
				macchiato = {
					base = "#222429",
				},
			},
			transparent_background = false,
			integrations = {
				alpha = true,
				cmp = true,
				flash = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mason = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},


}
