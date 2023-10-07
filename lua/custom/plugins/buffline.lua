vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.opt.termguicolors = true
return {
	{
		'akinsho/bufferline.nvim',
		config = function()
			require("bufferline").setup {
				options = {
					-- separator_style = "slope"

				}
			}
		end,
		dependencies = 'nvim-tree/nvim-web-devicons'
	}
	,
	{ 'famiu/bufdelete.nvim' }

}
