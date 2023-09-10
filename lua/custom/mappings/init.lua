vim.keymap.set("n", ";", ":", { desc = "Command Mode" })
-- vim.keymap.set({ "n", "v" }, "<leader>ft", "<cmd>Neotree toggle<cr>", { desc = "Neotree Toggle" })
-- Command window
vim.keymap.set({ "n", "v" }, "cw", "q:", { desc = "Command Window" })
-- window Navigation remaps--
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Move window down" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Move window up" })
vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Move window right" })
vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Move window left" })
-- Escape mode with double jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "esc" })

-- Tmux Vim Navigation
vim.keymap.set('n', "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Navigator Left" })
vim.keymap.set('n', "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Navigator Right" })
vim.keymap.set('n', "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Navigator Down" })
vim.keymap.set('n', "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Navigator Up" })
-- Toggle term with nvim terminal
vim.keymap.set({ "n", "t" }, "<M-3>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })

vim.keymap.set({ "n", "t" }, "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "LSP Format" })
-- require("custom.mappings.mini")
