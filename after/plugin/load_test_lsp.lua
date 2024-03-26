local client = vim.lsp.start_client {
	name = "golsp",
	cmd = { "/home/mirsahebali/projects/lsp/main" },
	capabilites = vim.lsp.protocol.make_client_capabilities(),
}

if not client then
	vim.notify "Client ain't that good"
	return
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end
})
