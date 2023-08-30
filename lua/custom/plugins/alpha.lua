return {
	-- customize alpha options
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	opts = function(_, opts)
	-- 		-- customize the dashboard header
	-- 		opts.section.header.val = {
	-- 			"                                                     ",
	-- 			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	-- 			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	-- 			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	-- 			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	-- 			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	-- 			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	-- 			"                                                     ",
	-- 		}
	--
	-- 		return opts
	-- 	end,
	-- },
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
}
