return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- run the setup function after plugin is loaded
    config = function()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end,
  },
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "neovim/nvim-lspconfig", -- optional
  --   },
  --   opts = function()
  --     return {
  --       -- ...
  --       formatting = {},
  --     }
  --   end,
  -- },
}
