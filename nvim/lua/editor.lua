vim.opt.nu = true
vim.opt.relativenumber = true
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

if vim.g.colors_name == 'tokyonight-night' then
	vim.opt.colorcolumn = '80'
end

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8

vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '.' }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.js", "*.ts", "*.rs", "*.go", "*.lua", "*.c", "*.cpp", "*.h", "*.ml" },
	callback = function()
		vim.lsp.buf.format()
	end
})
