return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    opts = function()
      -- nvim-cmp configs
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local compare = require("cmp.config.compare")
      local lspkind = require("lspkind")

      lspkind.init()

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "git" },
          { name = "path" },
          { name = "buffer", keyword_length = 5 },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            menu = {
              nvim_lua = "[lua-api]",
              nvim_lsp = "[lsp]",
              path = "[path]",
              luasnip = "[snip]",
              buffer = "[buf]",
              gh_issues = "[issue]",
            },
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<tab>"] = cmp.config.disable,
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
          ["<C-m>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }, { "i", "c" }),
          ["<C-n>"] = {
            i = cmp.mapping.select_next_item(),
          },
          ["<C-p>"] = {
            i = cmp.mapping.select_prev_item(),
          },
          ["<C-Space>"] = cmp.mapping({
            i = cmp.mapping.complete(),
            c = function(_)
              if cmp.visible() then
                if not cmp.confirm({ select = true }) then
                  return
                end
              else
                cmp.complete()
              end
            end,
          }),
        }),

        sorting = {
          comparators = {
            compare.kind,
            compare.offset,
            compare.exact,
            compare.score,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
      }
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
      require("cmp_git").setup()
      -- require("cmp-cmdline").setup()
    end,
  },
}
