return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								work = "/home/mirsahebali/notes/work",
								home = "/home/mirsahebali/notes/home",
								cpp = "/home/mirsahebali/notes/cpp",
								go = "/home/mirsahebali/notes/go",
								fun = "/home/mirsahebali/notes/fun",
								winx = "/home/mirsahebali/notes/winx",
								sd = "/home/mirsahebali/notes/systems_design",
								maths = "/home/mirsahebali/notes/maths"
							},
						},
					},
				},
			}
		end,
	},
}
