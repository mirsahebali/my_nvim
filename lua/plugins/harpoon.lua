return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
        print("Harpoon: file added: " .. vim.api.nvim_buf_get_name(0))
      end, { desc = "Add file to harpoon list" })
      vim.keymap.set("n", "<leader>hl", function()
        toggle_telescope(harpoon:list())
      end, { desc = "harpoon list" })

      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
        print("Harpoon: file 1")
      end, { desc = "harpoon file 1" })
      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
        print("Harpoon: file 2")
      end, { desc = "harpoon file 2" })
      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
        print("Harpoon: file 3")
      end, { desc = "harpoon file 3" })
      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
        print("Harpoon: file 4")
      end, { desc = "harpoon file 4" })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
        print("Harpoon: list prev")
      end, { desc = "harpoon prev file" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
        print("Harpoon: list next")
      end, { desc = "harpoon next file" })

      vim.keymap.set("n", "<leader>hc", function()
        harpoon:list():clear()
        print("Harpoon: list cleared")
      end, { desc = "harpoon clear list" })
    end,
  },
}
