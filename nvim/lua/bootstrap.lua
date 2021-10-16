local packer_exists = pcall(vim.cmd, [[ packadd packer.nvim ]])
if not packer_exists then
  local dest = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))
  local repo_url = "https://github.com/wbthomason/packer.nvim"

  vim.fn.mkdir(dest, "p")

  print("Downloading packer..")
  vim.fn.system(string.format("git clone %s %s", repo_url, dest .. "packer.nvim"))
  vim.cmd([[packadd packer.nvim]])
  vim.schedule_wrap(function()
    vim.cmd("PackerSync")
    print("plugins installed")
  end)
end

vim.cmd([[autocmd BufWritePost bootstrap.lua PackerCompile]])

-- load plugins
return require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "junegunn/fzf", run = ":call fzf#install()" })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- git
  use({
    "TimUntersberger/neogit",
    requires = { "tpope/vim-rhubarb" },
    config = function()
      local opts = { noremap = true, silent = true }
      local mappings = {
        { "n", "\\", [[<cmd>Neogit<cr>]], opts },
        { "n", "<leader>gp", [[<Cmd>Git push<CR>]], opts },
        { "n", "<leader>gs", [[<Cmd>G<CR>]], opts },
      }

      for _, m in pairs(mappings) do
        vim.api.nvim_set_keymap(unpack(m))
      end
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({ numhl = true })
    end,
  })

  use({
    "rlch/github-notifications.nvim",
    config = function()
      require("github-notifications").setup({
        username = "ellisonleao",
        mappings = {
          mark_read = "<Tab>",
          open_in_browser = "<CR>",
        },
      })
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })

  -- local
  use({ "fatih/vim-go", run = { "GoUpdateBinaries" }, ft = { "go" } })

  -- plugin development and utils
  use({ "nvim-lua/plenary.nvim" })
  use({
    "nvim-lua/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
    requires = { "nvim-lua/popup.nvim" },
  })
  use({ "mjlbach/babelfish.nvim" })
  use({ "folke/lua-dev.nvim" })

  -- editor
  use({"terrortylor/nvim-comment"})
  use({"windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      map_cr = true,
      map_complete = true,
      auto_select = true,
      insert = false,
      map_char = {
      all = '(',
      tex = '{'
    }
  })
end,
  })

  use({
    "mhartington/formatter.nvim",
    config = function()
      require("plugins.formatter")
    end,
  })

  -- lsp, completion, linting and snippets
  use({ "rafamadriz/friendly-snippets" })
  use({
    "glepnir/lspsaga.nvim",
    config = function()
      require("plugins.lspsaga")
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp")
    end,
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
  })
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
    requires = { "kabouzeid/nvim-lspinstall" },
  })

  -- visual
  use({ "folke/tokyonight.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })

  use({
    "shadmansaleh/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  })

  -- buffer tabs at top
  use({
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("bufferline").setup({ options = { numbers = "both" } })
    end,
  })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter").config()
    end,
  })
end)
