
local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then return end

configs.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
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
    "cpp",
    "dockerfile",
    "bibtex",
    "java",
    "php",
    "solidity",
  },
}

