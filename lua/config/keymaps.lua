-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just usvime <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("i", "jk", function()
  vim.opt.timeoutlen = 50
  vim.cmd([[stopinsert]])
  vim.opt.timeoutlen = 300
end, { desc = "Escape insert mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window mapping to leader" })

vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Term Navigate Left" })
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Term Navigate Right" })
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Term Navigate Up" })
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Term Navigate Down" })

--
-- Resize maps
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize down" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize right" })

-- terminal resizing
vim.keymap.set("t", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize up" })
vim.keymap.set("t", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize down" })
vim.keymap.set("t", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
vim.keymap.set("t", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- Oil.nvim Keymaps
vim.keymap.set("n", "-", "<cmd> lua require('oil').open_float()<cr>", { desc = "Open directory" })
vim.keymap.set("n", "<leader>.", "<cmd> lua require('oil').open_float('.')<cr>", { desc = "Open directory" })
vim.keymap.set("n", "<leader><leader>c", function()
  require("oil").open_float(vim.env.HOME .. "/.config/nvim")
end, { desc = "Open neovim config" })

-- Buffer mappings
vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>C", ":BufferLineCloseOthers<CR>", { desc = "Delete buffer" })

-- Neovim Sourcing Mapping
vim.keymap.set("n", "<leader>sop", ":so ~/.config/nvim/lua/plugins/", { desc = "Source Lua" })
vim.keymap.set("n", "<leader>som", ":so ~/.config/nvim/lua/keymaps.lua<CR>", { desc = "Source Mappings" })

-- Insert mode keybindings
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<BS>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<ESC>$i", { noremap = true })

vim.keymap.set("n", "<leader>lr", "<CMD>Telescope lsp_references <CR>", { desc = "Search LSP References" })
vim.keymap.set("n", "<leader>ld", "<CMD>Telescope lsp_definitions <CR>", { desc = "Search LSP Definitions" })
vim.keymap.set("n", "<leader>lt", "<CMD>Telescope lsp_type_definitions <CR>", { desc = "Search LSP Type Definitions" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open Float diagnostic" })

vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Resize window left" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Resize window right" })

vim.keymap.set("n", "j", "gj", { desc = "Relatively go down" })
vim.keymap.set("n", "k", "gk", { desc = "Relatively go up" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
