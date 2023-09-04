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

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

-- Undo tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
