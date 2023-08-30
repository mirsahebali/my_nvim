vim.keymap.set("n", ";", ":", { desc = "Command Mode" })
vim.keymap.set({ "n", "v" }, "<leader>ft", "<cmd>Neotree toggle<cr>", { desc = "Neotree Toggle" })
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Move window down" })

vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Move window up" })
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Move window right" })
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Move window left" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "esc" })
require("custom.mappings.mini")
