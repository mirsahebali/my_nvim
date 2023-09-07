vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.opt.termguicolors = true

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<cr>", { desc = "Next Buffer", silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { desc = "Previous Buffer", silent = true })

vim.keymap.set("n", "<leader>x", ":bdelete<cr>", { desc = "Previous Buffer", silent = true })
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
