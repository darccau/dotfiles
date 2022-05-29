local packer = require 'packer'

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tamago324/lir.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use("nvim-lua/plenary.nvim")

    use("numToStr/Comment.nvim")

    use 'windwp/nvim-autopairs'

    use 'nvim-telescope/telescope.nvim'

    use 'mhartington/formatter.nvim'

    use 'folke/tokyonight.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-treesitter/nvim-treesitter'

    use 'alvan/vim-closetag'

    use 'TimUntersberger/neogit'

    -- editor
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end,
    })

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

end)
