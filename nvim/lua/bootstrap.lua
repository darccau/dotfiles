local packer = require 'packer'

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tamago324/lir.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    -- plugin development and utils
    use({
        "nvim-lua/plenary.nvim",
        config = function()
            vim.keymap.set("n", "<leader>tp", function()
                require("plenary.test_harness").test_directory(vim.fn.expand("%:p"))
            end, { noremap = true, silent = true })
        end,
    })

    use 'windwp/nvim-autopairs'

    use 'nvim-telescope/telescope.nvim'

    use 'mhartington/formatter.nvim'

    use 'folke/tokyonight.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-treesitter/nvim-treesitter'

    use 'alvan/vim-closetag'

    use 'TimUntersberger/neogit'

    -- testing
    use({
        "vim-test/vim-test",
        config = function()
            local opts = { noremap = true, silent = true }
            local mappings = {
                { "n", "<leader>t", [[<Cmd>TestNearest<CR>]], opts }, -- call test for function in cursor
                { "n", "<leader>tt", [[<Cmd>TestFile<CR>]], opts }, -- call test for current file
            }

            for _, m in pairs(mappings) do
                vim.keymap.set(unpack(m))
            end
        end,
    })


    use({ "neovim/nvim-lspconfig", requires = { "williamboman/nvim-lsp-installer" } })

    use({
        "TimUntersberger/neogit",
        requires = {
            "sindrets/diffview.nvim",
        },
        config = function()
            require("neogit").setup({
                kind = "split",
                integrations = { diffview = true },
                disable_commit_confirmation = true,
            })
        end,
    })

    use({
        "WhoIsSethDaniel/goldsmith.nvim",
        run = ":GoInstallBinaries",
        requires = { "antoinemadec/FixCursorHold.nvim" },
    })


end)
