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

local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd [[colorscheme tokyonight-night]]
		end
	},
	{ 'folke/todo-comments.nvim',        dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	-- "lukas-reineke/indent-blankline.nvim",

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},

	'ThePrimeagen/harpoon',
	-- 'hrsh7th/cmp-nvim-lsp-signature-help',
	'tpope/vim-surround',
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	'nvim-treesitter/nvim-treesitter-context',
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	'nvim-treesitter/playground',
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

	'tpope/vim-fugitive',
	'alvan/vim-closetag',
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},

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
	{ 'j-hui/fidget.nvim', tag = 'legacy' },

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
	{
		'echasnovski/mini.nvim',
		config = function()
			require('mini.completion').setup()
		end
	},

}
local opts = {}

require('lazy').setup(plugins, opts)
