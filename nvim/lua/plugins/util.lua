return {
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    ft = {
      "lua",
      "html",
      "vue",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "css",
    },
    opts = function(self, opts)
      return vim.tbl_deep_extend("force", opts, {
        filetypes = self.ft,
        user_default_options = {
          RRGGBBAA = true,
          tailwind = true,
        },
      })
    end,
  },

  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    opts = function()
      local set_filetype_bigfile = {
        name = "detect_bigfile",
        opts = { defer = true },
        disable = function()
          vim.api.nvim_set_option_value("filetype", "bigfile", { scope = "local" })
        end,
      }

      local cmp = {
        name = "cmp",
        opts = { defer = true },
        disable = function()
          local ok, cmp = pcall(require, "cmp")
          if ok then
            cmp.setup.buffer({ enabled = false })
          end
        end,
      }

      local mini_indentscope = {
        name = "mini_indentscope",
        opts = { defer = true },
        disable = function()
          vim.b.miniindentscope_disable = true
        end,
      }

      return {
        filesize = 0.5, -- unit MB
        pattern = { "*" },
        features = {
          "treesitter",
          "lsp",
          "illuminate",
          "indent_blankline",
          "syntax",
          "vimopts",
          set_filetype_bigfile,
          cmp,
          mini_indentscope,
        },
      }
    end,
  },

  {
    "2nthony/sortjson.nvim",
    cmd = {
      "SortJSONByAlphaNum",
      "SortJSONByAlphaNumReverse",
      "SortJSONByKeyLength",
      "SortJSONByKeyLengthReverse",
    },
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = {
      window = {
        width = 0.8,
        options = {
          number = false,
        },
      },
      plugins = {
        gitsigns = {
          enabled = true,
        },
      },
    },
  },

  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 10,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {},
    },
  },

  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = true,
    keys = {
      { "j", "<Plug>(accelerated_jk_gj)" },
      { "k", "<Plug>(accelerated_jk_gk)" },
    },
    opts = {
      mode = "time_driven",
      enable_deceleration = false,
      acceleration_motions = {},
      acceleration_limit = 150,
      acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
      deceleration_table = { { 150, 9999 } },
    },
  },
}
