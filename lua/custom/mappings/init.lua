-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Command window
vim.keymap.set({ "n", "v" }, "cw", "q:", { desc = "Command Window" })

vim.keymap.set({ "n", "v" }, "K", function()
	require("pretty_hover").hover()
end, { desc = "Command Window" })
-- window Navigation remaps--
vim.keymap.set({ "n", "v", "t" }, "<C-j>", "<C-w>j", { desc = "Move window down" })
vim.keymap.set({ "n", "v", "t" }, "<C-k>", "<C-w>k", { desc = "Move window up" })
vim.keymap.set({ "n", "v", "t" }, "<C-l>", "<C-w>l", { desc = "Move window right" })
vim.keymap.set({ "n", "v", "t" }, "<C-h>", "<C-w>h", { desc = "Move window left" })
-- Save file
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = " [F]ile [S]ave" })
-- Tmux Vim Navigation
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux Navigator Left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux Navigator Right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux Navigator Down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux Navigator Up" })
-- Toggle term with nvim terminal
vim.keymap.set({ "n", "t", "v" }, "<C-\\>", "<cmd>ToggleTerm direction=float <cr>", { desc = "ToggleTerm" })
vim.keymap.set({ "n", "t", "v" }, "<M-\\>", "<cmd>ToggleTerm direction=vertical size=38<cr>", { desc = "ToggleTerm" })
vim.keymap.set({ "n", "t" }, "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "LSP Format" })
-- require("custom.mappings.mini")
-- Buffline Mappings

vim.keymap.set("n", "<M-i>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<M-u>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })

vim.keymap.set("n", "<leader>C", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close all other buffers", silent = true })
-- Line diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- Telescope mappings

vim.keymap.set(
	"n",
	"<leader>f/",
	"<cmd>Telescope current_buffer_fuzzy_find<cr>",
	{ desc = "Find in current buffer", silent = true }
)

-- Oil.nvim Keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--MultiCursor Mappings
vim.keymap.set({ "n", "v" }, "<M-,>", "<cmd>MCstart<cr>", { desc = "Start MultiCursor" })


vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fb', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = ' [F]uzzily search in current [b]uffer' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fF', '<cmd>Telescope find_files hidden=true<cr>', { desc = '[F]ind [F]iles' })


-- Diagnostics mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
