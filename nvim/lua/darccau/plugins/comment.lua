local setup = function()
  require("Comment").setup(
  {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = ";;",
    },
    opleader = {
      line = ";",
    },
    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
  })
end

return {
    -- event = "VeryLazy",
    "numToStr/Comment.nvim",
    -- lazy = false,
    config = setup,
}
