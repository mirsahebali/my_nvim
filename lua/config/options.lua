-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.list = true

vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↲" }

vim.g.lazyvim_picker = "snacks"

vim.o.scrolloff = 20

vim.o.termguicolors = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- vim: ts=2 sts=2 sw=2 et
