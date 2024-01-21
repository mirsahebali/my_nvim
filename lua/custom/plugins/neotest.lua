return { {
	"nvim-neotest/neotest",
	config = function()
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message =
					    diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub(
						    "^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go"),
				require("neotest-rust") {
					args = { "--no-capture" }, dap_adapter = "lldb",
				},
			},
		})
	end,
},

	{
		"nvim-neotest/neotest-go",
		-- Your other test adapters here
	},

	'rouge8/neotest-rust'
}
