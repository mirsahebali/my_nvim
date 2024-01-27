return { {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	opts = {
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = 'catppuccin',
			component_separators = '|',
			section_separators = '',
		},
	},
} }
