vim.cmd [[ packadd packer.nvim ]]
vim.cmd [[ colorscheme gruvbox ]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'airblade/vim-gitgutter'
    use 'morhetz/gruvbox'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'ThePrimeagen/harpoon'
    use 'tpope/vim-surround'
    use 'vim-airline/vim-airline'
    use 'nvim-treesitter/nvim-treesitter-context'
    use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
    use('nvim-treesitter/playground')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'tpope/vim-fugitive'
    use 'alvan/vim-closetag'
    use 'tpope/vim-commentary'
    use 'christoomey/vim-tmux-navigator'
    use 'mbbill/undotree'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
    use 'j-hui/fidget.nvim'
    use 'sbdchd/neoformat'

    -- Dap
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'leoluz/nvim-dap-go'
end)
