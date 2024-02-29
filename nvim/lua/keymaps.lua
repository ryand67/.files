-- Misc
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ev', vim.cmd.Ex)

vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>fwb", ":Focuswatch sw_start<CR>")
vim.keymap.set("n", "<leader>fwe", ":Focuswatch sw_stop<CR>")
vim.keymap.set("n", "<leader>fwtb", ":Focuswatch timer_start<CR>")
vim.keymap.set("n", "<leader>fwte", ":Focuswatch timer_stop<CR>")

vim.keymap.set("n", "rv", ":Regview<CR>")

vim.keymap.set('n', 'ts', function()
	vim.cmd [[ tab split ]]
end)

vim.keymap.set('n', 'tc', function()
	vim.cmd [[ tab close ]]
end)

vim.keymap.set('n', 'gb', function()
	vim.cmd [[Git blame]]
end)

vim.keymap.set('n', '<leader>ge', "oif err != nil {<CR>}<Esc>Oreturn err")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>km', builtin.keymaps, {})
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })

-- folke/trouble.nvim
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
