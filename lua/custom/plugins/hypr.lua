return {
	{
		"luckasRanarison/tree-sitter-hypr",
		config = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.hypr = {
				install_info = {
					url = "https://github.com/luckasRanarison/tree-sitter-hypr",
					files = { "src/parser.c" },
					branch = "master",
				},
				filetype = "hypr",
			}
		end,
	},
	{
		"luckasRanarison/tree-sitter-hyprlang",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	}
}
