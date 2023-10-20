local bar = "|"

local function get_root()
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  path = path and vim.fs.dirname(path) or vim.loop.cwd()
  local root = vim.fs.find({ ".git", "/lua" }, { path = path, upward = true })[1]
  root = root and vim.fs.dirname(root) or vim.loop.cwd()
  return root
end

local function telescope(builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    require("telescope.builtin")[builtin](opts)
  end
end

return {
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "VeryLazy" },
    opts = {
      padding = true,
      toggler = {
        block = "<leader>c",
        line = "<leader>c",
      },
    },

    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "text" },
      disable_in_macro = false,
      check_ts = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    lazy = true,
    keys = { { "<leader>l", "<cmd>Neotree toggle<CR>", desc = "Open neo-tree.nvim" } },
    cmd = "Neotree",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
          },
          never_show = {
            ".DS_Store",
          },
          always_show = {
            ".env",
          },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["s"] = "",
          ["S"] = "",
          ["<C-x>"] = "",
          ["o"] = "open",
          ["<cr>"] = "open",
          ["<C-s>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
          ["<C-f>"] = "clear_filter",
          ["g?"] = "show_help",
          ["/"] = "", -- default search down
          ["?"] = "", --default search above
        },
      },
      nesting_rules = {
        ["js"] = { "js.map" },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    opts = {
      theme = "dropdown",
      defaults = {
        preview = false,
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
          "**/debug/",
          "target/release/",
          ".yarn/*",
        },
      },
      pickers = {
        find_files = {
          no_ignore = false,
          hidden = true,
        },
        oldfiles = {
          cwd_only = true,
        },
      },
    },
    config = function(_, opts)
      local theme = require("telescope.themes")["get_" .. (opts.theme or "dropdown")]
      if theme then
        opts.defaults = theme(opts.defaults)
      end

      if vim.fn.executable("rg") then
        opts.defaults.vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        }
      end

      require("telescope").setup(opts)
    end,
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = vim.fn.executable("fzf"),
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      { "<leader><leader>", telescope("buffers") },
      { "<leader>g", telescope("live_grep") },
      { "<leader>f", telescope("files") },
    },
  },
}
