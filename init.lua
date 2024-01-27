-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',
  -- If commented then it's disabled
  -- require 'kickstart.plugins.codeium',
  { import = 'custom.plugins' },
}, {})
-- NOTE: You can change these options as you wish!
require 'custom.mappings.init'
require 'custom.plugins.mini'
require 'custom.opts'
-- See `:help vim.highlight.on_yank()`

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'node_modules', 'prisma/migrations' },
    mappings = {
      i = {
        ['<C-u>'] = true,
        ['<C-d>'] = true,
      },
    },
  },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Colorscheme setup
-- pcall(require("catppuccin").setup({}), "catppuccin")
vim.cmd [[colorscheme catppuccin]]
require("custom.treesitter")
require("custom.lsp")

-- vim: ts=2 sts=2 sw=2 et
