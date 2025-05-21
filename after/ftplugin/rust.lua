local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>cr", function()
  vim.lsp.buf.rename()
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>ct", function()
  vim.cmd([[ Cargo nextest run --no-capture --no-fail-fast ]])
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { silent = true, buffer = bufnr }
)
