local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ colorscheme gruvbox-material ]]
-- vim.g.gruvbox_material_background = "hard"
-- vim.cmd [[colorscheme tokyonight]]

local plugins = {
	'wbthomason/packer.nvim',
	'airblade/vim-gitgutter',
	-- 'morhetz/gruvbox'
	'sainnhe/gruvbox-material',
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- "lukas-reineke/indent-blankline.nvim"

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},

	'ThePrimeagen/harpoon',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'tpope/vim-surround',
	'vim-airline/vim-airline',
	'nvim-treesitter/nvim-treesitter-context',
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	'nvim-treesitter/playground',
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

	'tpope/vim-fugitive',
	'alvan/vim-closetag',
	'tpope/vim-commentary',
	'christoomey/vim-tmux-navigator',
	'mbbill/undotree',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	},
	{ 'j-hui/fidget.nvim',               tag = 'legacy' },

	-- 'sbdchd/neoformat',
	{
		'stevearc/conform.nvim',
		opts = {},
	},

	-- Dap
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'leoluz/nvim-dap-go',

	'NvChad/nvim-colorizer.lua',
}
local opts = {}

require('lazy').setup(plugins, opts)
vim.cmd [[colorscheme tokyonight]]
