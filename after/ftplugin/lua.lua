vim.lsp.config("lua-language-server", {
  cmd = "/usr/bin/lua-language-server",
  settings = {
    lua_ls = {},
  },
})
vim.lsp.enable("lua-language-server")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.lua",
  command = ":lsp enable lua_ls",
})
