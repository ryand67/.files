local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.cmd [[colorscheme tokyonight-night]]
	-- 	end
	-- },
	-- { "projekt0n/github-nvim-theme" },
	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},
	-- { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },
	{ "folke/neodev.nvim", lazy = true, opts = {} },
	{ "marko-cerovac/material.nvim" },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- "lukas-reineke/indent-blankline.nvim",

	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim", "jonarrien/telescope-cmdline.nvim" } },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },

	{ "ThePrimeagen/harpoon", branch = "harpoon2" },
	{
		"sindrets/diffview.nvim",
		lazy = true,
	},
	-- 'hrsh7th/cmp-nvim-lsp-signature-help',
	"tpope/vim-surround",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"nvim-treesitter/nvim-treesitter-context",
	{ "nvim-treesitter/nvim-treesitter", lazy = true, build = ":TSUpdate" },
	{
		"nvim-treesitter/playground",
		lazy = true,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"alvan/vim-closetag",
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	"christoomey/vim-tmux-navigator",
	"mbbill/undotree",

	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},
	{ "saadparwaiz1/cmp_luasnip" }, -- Optional
	{ "j-hui/fidget.nvim", tag = "legacy" },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- 'sbdchd/neoformat',
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	"tpope/vim-sleuth",
	{
		"stevearc/oil.nvim",
		lazy = false,
	},

	"NvChad/nvim-colorizer.lua",
	{
		"chentoast/marks.nvim",
		lazy = true,
		config = function()
			require("marks").setup()
		end,
	},
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest")({
						filter_dir = function(name, rel_path, root)
							return name ~= "node_modules"
						end,
					}),
				},
			})
		end,
	},
	{ "tpope/vim-dadbod", lazy = true },
	{ "kristijanhusak/vim-dadbod-completion", lazy = true },
	{ "kristijanhusak/vim-dadbod-ui", lazy = true },
	--DAP
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	dependencies = {
	-- 		"rcarriga/nvim-dap-ui",
	-- 		"theHamsta/nvim-dap-virtual-text",
	-- 		"nvim-neotest/nvim-nio",
	-- 		"williamboman/mason.nvim",
	-- 	},
	-- 	config = function()
	-- 		local dap = require("dap")
	-- 		local ui = require("dapui")
	-- 		require("dapui").setup()
	-- 		require("nvim-dap-virtual-text").setup()
	--
	-- 		local js_based_languages = { "typescript", "javascript", "typescriptreact", "svelte" }
	--
	-- 		for _, language in ipairs(js_based_languages) do
	-- 			dap.configurations[language] = {
	-- 				{
	-- 					type = "pwa-node",
	-- 					request = "launch",
	-- 					name = "Launch file",
	-- 					program = "${file}",
	-- 					cwd = "${workspaceFolder}",
	-- 				},
	-- 				{
	-- 					type = "pwa-node",
	-- 					request = "attach",
	-- 					name = "Attach",
	-- 					processId = require("dap.utils").pick_process,
	-- 					cwd = "${workspaceFolder}",
	-- 				},
	-- 				{
	-- 					type = "pwa-chrome",
	-- 					request = "launch",
	-- 					name = 'Start Chrome with "localhost"',
	-- 					url = "http://localhost:3000",
	-- 					webRoot = "${workspaceFolder}",
	-- 					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
	-- 				},
	-- 			}
	-- 		end
	--
	-- 		dap.adapters["pwa-node"] = function(cb)
	-- 			cb({
	-- 				type = "server",
	-- 				host = "127.0.0.1",
	-- 				port = 3000,
	-- 			})
	-- 		end
	--
	-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 			ui.open({})
	-- 		end
	-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 			ui.close({})
	-- 		end
	-- 		dap.listeners.before.event_exited["dapui_config"] = function()
	-- 			ui.close({})
	-- 		end
	-- 	end,
	-- },
	-- {
	-- 	"mxsdev/nvim-dap-vscode-js",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("dap-vscode-js").setup({
	-- 			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	-- 			adapters = {
	-- 				"chrome",
	-- 				"pwa-node",
	-- 				"pwa-chrome",
	-- 				"pwa-msedge",
	-- 				"node-terminal",
	-- 				"pwa-extensionHost",
	-- 				"node",
	-- 				"chrome",
	-- 			},
	-- 			debugger_cmd = { "js-debug-adapter" },
	-- 		})
	-- 	end,
	-- },
}
local opts = {}

require("lazy").setup(plugins, opts)
-- require("bluloco").setup({
-- 	style = "auto", -- "auto" | "dark" | "light"
-- 	transparent = false,
-- 	italics = false,
-- 	terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
-- 	guicursor = true,
-- })

vim.opt.termguicolors = true
-- vim.cmd("colorscheme bluloco")
vim.cmd("colorscheme kanagawa-wave")
