return {
	{
		"onsails/lspkind.nvim",
		config = function()
			local cmp = require("cmp")
			local lspkind = require('lspkind')
			cmp.setup {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol', -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

						before = function(entry, vim_item)
							return vim_item
						end
					})
				}
			}
		end
	}
}
