return {
  {
    event = "VeryLazy",
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          "branch",
        },
        lualine_b = {
          "buffers",
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_v = {},
        lualine_c = {},
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
