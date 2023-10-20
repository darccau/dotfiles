return {
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = { "LspAttach" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "gi",
        "<cmd>Lspsaga incoming_calls<cr>",
        "Show incoming calls",
      },
      {
        "go",
        "<cmd>Lspsaga outgoing_calls<cr>",
        "Show outgoing calls",
      },
      {
        "C-]",
        "<cmd>Lspsaga peek_definition<cr>",
        desc = "Preview LSP definition",
      },
      {
        "C-}",
        "<cmd>Lspsaga peek_type_definition<cr>",
        "Go to type definition",
      },
      {
        "gd",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Go to definition",
      },
      {
        "K",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "Show documentation",
      },
    },
    opts = {
      ui = {
        border = "rounded",
        title = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
      },
      definition = {
        edit = "<cr>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
      },
      lightbulb = {
        sign = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      beacon = {
        enable = false,
      },
      implement = {
        enable = false,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim", lazy = true },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
          ui = {
            icons = {
              package_installed = "",
              package_pending = "",
              package_uninstalled = "",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
          ensure_installed = {
            "lua_ls",
            "terraformls",
            "ruff",
            "gopls",
            "tsserver",
          },
        },
      },
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        opts = {
          ensure_installed = {
            "stylua",
            "isort",
            "black",
            "terraform_fmt",
            "prettier",
            "golangci-lint",
            "gofmt",
          },
        },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      -- Load neodev.nvim before loading everything else
      require("neodev").setup()
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.gopls.setup({})
      lspconfig.terraformls.setup({})
    end,
  },

  -- null-ls.nvim
  -- WARNING: null-ls.nvim will be archived on August 11, 2023
  -- Find a suitable replacement soon
  -- Related: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1621
  -- NOTE: Look into alternatives
  -- Related: https://github.com/mhartington/formatter.nvim and https://github.com/mfussenegger/nvim-lint
  -- NOTE: mason-tools-installer.nvim seems to work for installing the tools I need, but doesn't seem to work properly.
  -- Keep looking into this, maybe it's a config error on my end?
  -- Related: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local nls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.isort,
          nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.terraform_fmt,
          nls.builtins.formatting.black,
          nls.builtins.formatting.mdformat,
        },
        on_attach = function(client, bufnr)
          -- Autoformat on save if supported
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  -- I don't really like the style of lua_ls's formatting, so I exclude it and instead use stylua
                  ---@diagnostic disable-next-line: redefined-local
                  filter = function(client)
                    return client.name ~= "lua_ls"
                  end,
                })
              end,
            })
          end
        end,
      }
    end,
  },
}
