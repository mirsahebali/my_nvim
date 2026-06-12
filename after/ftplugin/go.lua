vim.lsp.config("gopls", {
  settings = {
    gopls = {
      completeUnimported = true,
    },
  },
})

vim.lsp.enable("gopls")
