return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "comment",
        "markdown", -- lsp, lspsaga diagnostic
        "json",
        "markdown_inline",
        "javascript",
        "typescript",
        "gowork",
        "gosum",
        "fish",
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "http",
        "java",
        "make",
        "lua",
        "php",
        "sql",
        "yaml",
      })
    end,
  },
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
    "b0o/incline.nvim",
    dependencies = {},
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require("incline.helpers")
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local buffer = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = "#363944",
          }
          return buffer
        end,
      })
    end,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      opts.presets.lsp_doc_border = true
    end,
  },
}
