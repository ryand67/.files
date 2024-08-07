-- Misc
vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>ev", vim.cmd.Ex)

-- open term
vim.keymap.set("n", "<leader>ot", function()
	vim.cmd([[ new ]])
	vim.cmd([[ term ]])
	vim.cmd([[ terminal fish ]])
end, { desc = "Open Terminal" })
-- back to normal mode in term
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>q", ":copen<CR>", { desc = "Open Quickfix List" })
vim.keymap.set("n", "<leader>k", ":cprev<CR>", { desc = "Goto Previous Quick List Item" })
vim.keymap.set("n", "<leader>j", ":cnext<CR>", { desc = "Goto Next Quickfix List Item" })

vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Lsp Restart" })

vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>fwb", ":Focuswatch sw_start<CR>")
vim.keymap.set("n", "<leader>fwe", ":Focuswatch sw_stop<CR>")
vim.keymap.set("n", "<leader>fwtb", ":Focuswatch timer_start<CR>")
vim.keymap.set("n", "<leader>fwte", ":Focuswatch timer_stop<CR>")

vim.keymap.set("n", "ts", function()
	vim.cmd([[ tab split ]])
end)

vim.keymap.set("n", "tc", function()
	vim.cmd([[ tab close ]])
end)

vim.keymap.set("n", "gb", function()
	vim.cmd([[Git blame]])
end)

vim.keymap.set("n", "<leader>ge", "oif err != nil {<CR>}<Esc>Oreturn err")
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope cmdline<cr>", { desc = "Telescope Cmdline" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find By Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help Tags" })
vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Current Buffer Fuzzy Find" })

-- folke/trouble.nvim
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "Launch Trouble" })
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "Trouble Workplace Diagonostics" })
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "Trouble Document Diagnostics" })
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "Trouble Quickfix" })
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "Trouble loclist" })
vim.keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end, { desc = "Trouble Lsp References" })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git" })

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Diffview.nvim
vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>dvfh", ":DiffviewFileHistory<CR>", { desc = "Diffview File History" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ev", "<CMD>Oil<CR>", { desc = "Launch Oil" })
vim.keymap.set("n", "<C-p>", function()
	require("oil").actions.preview()
end, { desc = "Oil Preview" })

-- Neotest
local nt = require("neotest")
vim.keymap.set("n", "<leader>tr", function()
	nt.run.run()
end, { desc = "Test Run" })

vim.keymap.set("n", "<leader>tra", function()
	nt.run.run(vim.fn.expand("%"))
end, { desc = "Test Run All" })

vim.keymap.set("n", "<leader>trs", ":Neotest summary<CR>", { desc = "Neotest Summary" })
