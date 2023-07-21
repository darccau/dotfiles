return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "comment",
        "lua",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "java",
        "php",
        "go",
        "fish",
        "json",
        "yaml",
        "html",
        "css",
        "scss",
        "vue",
        "svelte",
        "markdown", -- lsp, lspsaga diagnostic
      },
      ignore_install = {
        "haskell",
      },
      highlight = {
        enable = true,
      },
    },
    dependencies = {
      {
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
          },
        },
      },
    },
  },
}
