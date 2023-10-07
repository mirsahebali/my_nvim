vim.keymap.set('n', ';', ':', { desc = 'Command Mode' })
-- vim.keymap.set({ "n", "v" }, "<leader>ft", "<cmd>Neotree toggle<cr>", { desc = "Neotree Toggle" })
-- Command window
vim.keymap.set({ 'n', 'v' }, 'cw', 'q:', { desc = 'Command Window' })
-- window Navigation remaps--
vim.keymap.set({ 'n', 'v', 't' }, '<C-j>', '<C-w>j', { desc = 'Move window down' })
vim.keymap.set({ 'n', 'v', 't' }, '<C-k>', '<C-w>k', { desc = 'Move window up' })
vim.keymap.set({ 'n', 'v', 't' }, '<C-l>', '<C-w>l', { desc = 'Move window right' })
vim.keymap.set({ 'n', 'v', 't' }, '<C-h>', '<C-w>h', { desc = 'Move window left' })
-- Save file
vim.keymap.set('n', '<leader>sf', '<cmd>w<cr>', { desc = '[S]ave [F]ile' })
-- Tmux Vim Navigation
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Tmux Navigator Left' })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Tmux Navigator Right' })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Tmux Navigator Down' })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Tmux Navigator Up' })
-- Toggle term with nvim terminal
vim.keymap.set({ 'n', 't', 'v' }, '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm' })
vim.keymap.set({ 'n', 't', 'v' }, '<M-\\>', '<cmd>ToggleTerm direction=vertical size=38<cr>', { desc = 'ToggleTerm' })

vim.keymap.set({ 'n', 't' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'LSP Format' })
-- require("custom.mappings.mini")
-- Buffline Mappings

vim.keymap.set('n', '<M-i>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<M-u>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous Buffer' })

vim.keymap.set('n', '<leader>cl', ':bdelete<cr>', { desc = 'Previous Buffer', silent = true })
vim.keymap.set('n', '<leader>C', '<cmd>BufferLineCloseOthers<cr>', { desc = 'Close all other buffers', silent = true })
