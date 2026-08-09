return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    ft = { "go", "gomod", "gosum", "gowork" },
    config = function()
      require("dap-go").setup()
    end,
  },
}
