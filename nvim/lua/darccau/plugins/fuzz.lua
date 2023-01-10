local setup = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        ".git",
      },
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  config = setup,
  cmd = "Telescope",
  requires = "nvim-lua/plenary.nvim",
  keys = {
    {
      "<leader>r",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
    {
      "<leader>f",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
    },
    {
      "<leader>H",
      function()
        require("telescope.builtin").help_tags()
      end,
    },
  },
}
