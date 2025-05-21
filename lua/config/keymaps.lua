-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Snacks = require("snacks")
-- Oil.nvim Keymaps
vim.keymap.set("n", "-", "<cmd> lua require('oil').open_float()<cr>", { desc = "Open directory" })
vim.keymap.set("n", "<leader><leader>.", "<cmd> lua require('oil').open_float('.')<cr>", { desc = "Open directory" })
vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files({ cwd = "." })
end, { desc = "Open directory" })
