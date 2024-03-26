return { {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
	},

	cmd = "Telescope",
	opts = function()
		local actions = require "telescope.actions"
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"target"
				}
			},
			extentions = {
				theme = "ivy",
				hijack_netrw = true,
			}
		})
		require("telescope").load_extension "file_browser"
		return {
			mappings = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = { q = actions.close },
		}
	end
},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

}
