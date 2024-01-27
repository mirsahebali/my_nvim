return {
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VeryLazy",

		config = true,
		-- stylua: ignore
		keys = {
			{ "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			{ "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
		},
		opts = {
			keywords = {
				DONE     = { icon = " ", color = "#33cc33", alt = { "CHECKED" } },
				TEST     = { icon = "󰙨 ", color = "#CAA6F0", alt = { "TESTING", "PASSED", "FAILED" } },
				STRUCT   = { icon = " ", color = "#0066ff", alt = { "SCHEMA", "TYPE", "INTERFACE" } },
				IDEA     = { icon = " ", color = "#1585BD" },
				QUESTION = { icon = " ", color = "#FF0080", alt = { "QN", "DOUBT" } },
				FIXME    = { icon = "󰖷 ", color = "#FF0000", alt = { "GO_OVER" } },
				INFO     = { color = "#C6E87A", icon = " ", alt = { "ANNOTATION" } },
				DEBUG    = { color = "#A020F0", icon = " ", alt = { "FIX_IT" } },
				GOTCHA   = { color = "#05547D", icon = "󰱯 ", alt = { "FOOTGUN" } },
				NOTE     = { color = "#00FFEF", icon = "󱞁 ", alt = { "READ" } },
				REFACTOR = { color = "#E4E8FF", icon = "󰧹 ", alt = { "TIDY" } },
				REVIEW   = { color = "#FFC0CB", icon = " ", alt = { "DONT_MISS" } },
				PERF     = { color = "#7D7EEC", icon = "󰓅 ", alt = { "BOOST" } },
				REQ      = { color = "#1E90FF", icon = "󰼀 ", alt = { "REQUIREMENTS", "NEED", "NEEDED" } }
			},
		},
	},
}
