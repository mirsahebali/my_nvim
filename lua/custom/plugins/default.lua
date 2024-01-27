return {
	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',                opts = {} },
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
				vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
					{ buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
				vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},

	-- {
	--   -- Theme inspired by Atom
	--   'navarasu/onedark.nvim',
	--   -- priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme 'onedark'
	--   end,
	-- },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim',               opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'JoosepAlviste/nvim-ts-context-commentstring',
			'nvim-treesitter/nvim-treesitter-textobjects',
			-- HACK: remove when https://github.com/windwp/nvim-ts-autotag/issues/125 closed.
			{ 'windwp/nvim-ts-autotag', opts = { autotag = { enable_close_on_slash = false } } },
		},
		event = 'User AstroFile',
		cmd = {
			'TSBufDisable',
			'TSBufEnable',
			'TSBufToggle',
			'TSDisable',
			'TSEnable',
			'TSToggle',
			'TSInstall',
			'TSInstallInfo',
			'TSInstallSync',
			'TSModuleInfo',
			'TSUninstall',
			'TSUpdate',
			'TSUpdateSync',
		},
		build = ':TSUpdate',
		opts = function()
			return {
				autotag = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = false },
				highlight = {
					enable = true,
					disable = function(_, bufnr)
						return vim.b[bufnr].large_buf
					end,
				},
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

				incremental_selection = { enable = true },
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['ak'] = { query = '@block.outer', desc = 'around block' },
							['ik'] = { query = '@block.inner', desc = 'inside block' },
							['ac'] = { query = '@class.outer', desc = 'around class' },
							['ic'] = { query = '@class.inner', desc = 'inside class' },
							['a?'] = { query = '@conditional.outer', desc = 'around conditional' },
							['i?'] = { query = '@conditional.inner', desc = 'inside conditional' },
							['af'] = { query = '@function.outer', desc = 'around function ' },
							['if'] = { query = '@function.inner', desc = 'inside function ' },
							['al'] = { query = '@loop.outer', desc = 'around loop' },
							['il'] = { query = '@loop.inner', desc = 'inside loop' },
							['aa'] = { query = '@parameter.outer', desc = 'around argument' },
							['ia'] = { query = '@parameter.inner', desc = 'inside argument' },
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							[']k'] = { query = '@block.outer', desc = 'Next block start' },
							[']f'] = { query = '@function.outer', desc = 'Next function start' },
							[']a'] = { query = '@parameter.inner', desc = 'Next argument start' },
						},
						goto_next_end = {
							[']K'] = { query = '@block.outer', desc = 'Next block end' },
							[']F'] = { query = '@function.outer', desc = 'Next function end' },
							[']A'] = { query = '@parameter.inner', desc = 'Next argument end' },
						},
						goto_previous_start = {
							['[k'] = { query = '@block.outer', desc = 'Previous block start' },
							['[f'] = { query = '@function.outer', desc = 'Previous function start' },
							['[a'] = { query = '@parameter.inner', desc = 'Previous argument start' },
						},
						goto_previous_end = {
							['[K'] = { query = '@block.outer', desc = 'Previous block end' },
							['[F'] = { query = '@function.outer', desc = 'Previous function end' },
							['[A'] = { query = '@parameter.inner', desc = 'Previous argument end' },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['>K'] = { query = '@block.outer', desc = 'Swap next block' },
							['>F'] = { query = '@function.outer', desc = 'Swap next function' },
							['>A'] = { query = '@parameter.inner', desc = 'Swap next argument' },
						},
						swap_previous = {
							['<K'] = { query = '@block.outer', desc = 'Swap previous block' },
							['<F'] = { query = '@function.outer', desc = 'Swap previous function' },
							['<A'] = { query = '@parameter.inner', desc = 'Swap previous argument' },
						},
					},
				},
			}
		end,
		-- config = require "plugins.configs.nvim-treesitter",
	}, }
