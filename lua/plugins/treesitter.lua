return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter-intro`
    config = function()
      -- ensure basic parser are installed
      local parsers =
        { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" }
      require("nvim-treesitter").install(parsers)

      ---@param buf integer
      ---@param language string
      local function treesitter_try_attach(buf, language)
        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enables syntax highlighting and other treesitter features
        vim.treesitter.start(buf, language)

        -- enables treesitter based folds
        -- for more info on folds see `:help folds`
        -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- vim.wo.foldmethod = "expr"

        -- check if treesitter indentation is available for this language, and if so enable it
        -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
        local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil

        -- enables treesitter based indentation
        if has_indent_query then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      local available_parsers = require("nvim-treesitter").get_available()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end

          local installed_parsers = require("nvim-treesitter").get_installed("parsers")

          if vim.tbl_contains(installed_parsers, language) then
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
            require("nvim-treesitter").install(language):await(function()
              treesitter_try_attach(buf, language)
            end)
          else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- configuration
      require("nvim-treesitter-textobjects").setup({
        move = {
          set_jumps = true,
        },
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },
      })

      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end, { desc = "Select around function" })

      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inner function" })

      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end, { desc = "Select around class" })

      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inner class" })

      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      end, { desc = "Select around local scope" })

      vim.keymap.set("n", "<leader>a", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end, { desc = "Swap parameter with next" })

      vim.keymap.set("n", "<leader>A", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
      end, { desc = "Swap parameter with previous" })

      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      vim.keymap.set(
        { "n", "x", "o" },
        ";",
        ts_repeat_move.repeat_last_move_next,
        { desc = "Repeat last Treesitter move forward" }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        ",",
        ts_repeat_move.repeat_last_move_previous,
        { desc = "Repeat last Treesitter move backward" }
      )

      -- Make builtin f, F, t, T repeatable
      vim.keymap.set(
        { "n", "x", "o" },
        "f",
        ts_repeat_move.builtin_f_expr,
        { expr = true, desc = "Find char forward (repeatable)" }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "F",
        ts_repeat_move.builtin_F_expr,
        { expr = true, desc = "Find char backward (repeatable)" }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "t",
        ts_repeat_move.builtin_t_expr,
        { expr = true, desc = "Till char forward (repeatable)" }
      )

      vim.keymap.set(
        { "n", "x", "o" },
        "T",
        ts_repeat_move.builtin_T_expr,
        { expr = true, desc = "Till char backward (repeatable)" }
      )

      -- Move keymaps
      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })

      vim.keymap.set({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })

      vim.keymap.set({ "n", "x", "o" }, "]o", function()
        require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
      end, { desc = "Next loop start" })

      vim.keymap.set({ "n", "x", "o" }, "]s", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
      end, { desc = "Next local scope" })

      vim.keymap.set({ "n", "x", "o" }, "]z", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
      end, { desc = "Next fold start" })

      vim.keymap.set({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })

      vim.keymap.set({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })

      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })

      vim.keymap.set({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })

      vim.keymap.set({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })

      vim.keymap.set({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })

      -- Granular conditional movement
      vim.keymap.set({ "n", "x", "o" }, "]d", function()
        require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
      end, { desc = "Next conditional" })

      vim.keymap.set({ "n", "x", "o" }, "[d", function()
        require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
      end, { desc = "Previous conditional" })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
