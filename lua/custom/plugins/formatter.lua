return {
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			require('conform').setup {
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { 'stylua' },
					-- Conform will run multiple formatters sequentially
					python = { 'isort', 'black' },
					-- Use a sub-list to run only the first available formatter
					javascript = { { 'prettierd', 'prettier' } },
					typescript = { { 'prettierd', 'prettier' } },
					typescriptreact = { { 'prettierd', 'prettier' } },
					html = { { 'prettierd', 'prettier' } },
					javascriptreact = { { 'prettierd', 'prettier' } },
					go = { 'goimports' },
					c = { 'clang-format' },
					cpp = { 'clang-format' },
					haskell = { 'ormolu' },
					['_'] = { 'trim_whitespace' },
				},
			}
		end,
	},
}
