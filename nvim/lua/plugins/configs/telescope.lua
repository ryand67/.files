require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"_build",
			"build",
			".svelte-kit",
			".git",
		},
	},
})

require("telescope").load_extension("cmdline")
require("telescope").load_extension("ui-select")
