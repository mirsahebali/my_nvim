---@brief
---
--- https://github.com/godotengine/godot
---
--- Language server for GDScript, used by Godot Engine.

local port = "6005"
local cmd = vim.lsp.rpc.connect("/tmp/godot.pipe")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.gd",
  command = ":LspStart gdscript",
})

---@type vim.lsp.Config
return {
  cmd = cmd,
  filetypes = { "gd", "gdscript", "gdscript3" },
  root_markers = { "project.godot", ".git" },
}
