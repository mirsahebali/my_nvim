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
				noice = true,
				notify = true,
				neotree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		config = function()
			require("onedark").setup({
				style = "deep",
				transparent = true,
				diagnostics = {
					undercurl = false,
				},
			})
		end,
	},
	{
		"Shatur/neovim-ayu",
		lazy = true,
		config = function()
			require("ayu").setup({

				overrides = {
					Normal = { bg = "None" },
					ColorColumn = { bg = "None" },
					SignColumn = { bg = "None" },
					Folded = { bg = "None" },
					FoldColumn = { bg = "None" },
					CursorLine = { bg = "None" },
					CursorColumn = { bg = "None" },
					WhichKeyFloat = { bg = "None" },
					VertSplit = { bg = "None" },
				},
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			-- code
			-- Default options:
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})

			-- setup must be called before loading
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		-- If you are using Packer
		"shaunsingh/solarized.nvim",
	},
}
