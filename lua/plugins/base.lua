return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    -- customize alpha options
    -- {
    -- 	"goolord/alpha-nvim",
    -- },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      opts = {
        -- add any custom options here
      },
    },
    {
      "windwp/nvim-autopairs",
      enabled = false,
      event = "InsertEnter",
      -- Optional dependency
      -- dependencies = { 'hrsh7th/nvim-cmp' },
      config = function()
        require("nvim-autopairs").setup({})
        -- If you want to automatically add `(` after selecting a function or method
        -- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        -- local cmp = require 'cmp'

        -- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end,
    },
  },
  {
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end,
    },
  },
  {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },
}
