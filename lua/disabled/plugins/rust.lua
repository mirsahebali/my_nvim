return { {
	'saecki/crates.nvim',
	event = { "BufRead Cargo.toml" },
	config = function()
		require('crates').setup({})
	end,
},
	{
		'mrcjkb/rustaceanvim',
		version = '^3', -- Recommended
		ft = { 'rust' },
	}
}
