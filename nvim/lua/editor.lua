vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.guicursor = ""
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.colorcolumn = "100"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 15

vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "." }

vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.foldcolumn = 1
vim.opt.foldmethod = "manual"

-- vim.cmd([[ set switchbuf+=usetab,newtab ]])

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
