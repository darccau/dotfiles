local grep_picker = {
  preview = true,
  only_sort_text = true, -- don't include the filename in the search results
  path_display = { "shorten" },
}

return {
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
        live_grep = grep_picker,
        grep_string = grep_picker,
      },
    },
    config = function(_, opts)
      local theme = require("telescope.themes")["get_" .. (opts.theme or "dropdown")]
      if theme then
        opts.defaults = theme(opts.defaults)
      end

      if vim.fn.executable("rg") then
        -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua#LL87C36-L87C36
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
      { "<leader>f", ":Telescope find_files<cr>", desc = "Find Files" },
--      { "<leader>fF", false },
--      { "<leader>gf", Util.telescope("files", { cwd = false }), desc = "Git Files" },
--      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep" },
--      { "<leader>/", "<leader>sg", remap = true, desc = "Grep" },
--      { "<leader>sG", false },
--      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), desc = "Word" },
--      { "<leader>sW", false },
--      { "<leader>fR", false },
    },
  },
}
