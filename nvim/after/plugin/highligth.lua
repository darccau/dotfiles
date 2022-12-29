local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
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
})
