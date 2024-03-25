return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
      })
    end,
  },
  {
    "vimpostor/vim-tpipeline",
    config = function()
      vim.g.tpipeline_autoembed = 0
      vim.g.tpipeline_clearstl = 1
    end,
  },
}
