return {

	"ThePrimeagen/harpoon",
	config = function()
		vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add file" })

		vim.keymap.set("n", "<leader>hg", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Toggle quick menu" })
		vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Next" })
		vim.keymap.set("n", "<leader>hj", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Prev" })
	end
}
