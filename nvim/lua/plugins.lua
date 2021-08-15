local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        -- LSP 
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"

        -- Git
        use 'TimUntersberger/neogit'
         
        -- Gruvbox
        use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

        -- Close pairs
        use "windwp/nvim-autopairs"

        -- Comment
        use "terrortylor/nvim-comment"

       -- File managing
        use 'kyazdani42/nvim-tree.lua'
        use "nvim-telescope/telescope.nvim"

        -- Apparence and fancy stuff
        use "nvim-treesitter/nvim-treesitter"
        use "tomlion/vim-solidity"
        use "onsails/lspkind-nvim"
        use "kyazdani42/nvim-web-devicons"
        use "ryanoasis/vim-devicons"
        use "nvim-lua/popup.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- misc
        use "karb94/neoscroll.nvim"
        use "nvim-lua/plenary.nvim"
        use "kristijanhusak/orgmode.nvim"
    end
)
