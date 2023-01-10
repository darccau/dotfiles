local setup = function()
  require("nvim-treesitter").setup({
    highlight = { enable = true },
    indent = { enable = false },
    ensure_installed = {
      "go",
      "gomod",
      "python",
      "latex",
      "lua",
      "yaml",
      "json",
      "javascript",
      "bash",
      "typescript",
      "hcl",
      "make",
      "css",
      "tsx",
      "c",
      "fish",
      "cpp",
      "dockerfile",
      "bibtex",
      "java",
      "php",
      "solidity",
      "sql",
      "markdown",
      "toml",
    },
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
      swap = {
        enable = true,
        swap_next = {
          ["<leader>ps"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>pS"] = "@parameter.inner",
        },
      },
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  })
   vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

return {
    "nvim-treesitter/nvim-treesitter",
    config = setup,
    build = ":TSUpdate",
    event = "BufReadPost",
}
