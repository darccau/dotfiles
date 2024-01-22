return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      lualine_bold = true,
      terminal_colors = true,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      end,
    },
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          -- 'mason',
          -- 'dashboard',
          "NeogitStatus",
          "NeogitCommitView",
          "NeogitPopup",
          "NeogitConsole",
        },
      },
      sections = {
        lualine_a = { "branch" },
        lualine_c = { "filename" },
      },
      extensions = {
        "man",
        "toggleterm",
        "neo-tree",
        "symbols-outline",
        "trouble",
        "lazy",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "comment",
        "lua",
        "cpp",
        "c",
        "make",
        "dockerfile",
        "javascript",
        "typescript",
        "tsx",
        "sql",
        "terraform",
        "java",
        "php",
        "go",
        "gomod",
        "fish",
        "json",
        "python",
        "yaml",
        "http",
        "html",
        "css",
        "vue",
        "markdown",
      },
      context_commentstring = { enable = true, enable_autocmd = false },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    build = ":TSUpdate",
    event = "BufReadPost",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "windwp/nvim-ts-autotag",
      opts = {
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "xml",
          "markdown",
          "markdown_inline",
        },
      },
    },
  },

  --  {
  --    "lukas-reineke/indent-blankline.nvim",
  --    dependencies = "nvim-treesitter/nvim-treesitter",
  --    event = { "BufReadPost", "BufNewFile" },
  --    opts = {
  --      char = "▏",
  --      context_char = "▏",
  --      use_treesitter = true,
  --      show_first_indent_level = true,
  --      show_trailing_blankline_indent = false,
  --      show_current_context = true,
  --      show_current_context_start = true,
  --      filetype_exclude = {
  --        "help",
  --        "dashboard",
  --        "Trouble",
  --        "neogitstatus",
  --        "mason",
  --        "toggleterm",
  --        "lazy",
  --        "neo-tree",
  --      },
  --    },
  --  },
}
