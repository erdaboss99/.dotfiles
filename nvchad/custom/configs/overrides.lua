local M = {}

M.telescope = function()
	require("telescope").setup {
		defaults = {
			file_ignore_patterns = { "node_modules", ".git", ".next", ".DS_Store" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			git_files = {
				hidden = true,
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown {},
			},
		},
	}
	require("telescope").load_extension "ui-select"
end

M.lspconfig = function()
	require "plugins.configs.lspconfig"
	require "custom.configs.lspconfig"
end

local cmp = require "cmp"
M.cmp = {
	sources = {
		{
			name = "copilot",
			group_index = 2,
		},
		{
			name = "nvim_lsp",
			group_index = 2,
		},
		{
			name = "luasnip",
			group_index = 2,
		},
		{
			name = "buffer",
			group_index = 2,
		},
		{
			name = "nvim_lua",
			group_index = 2,
		},
		{
			name = "path",
			group_index = 2,
		},
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
	},
}

M.nvimtree = {
	filters = {
		dotfiles = false,
		custom = {
			"node_modules",
			".git",
			".DS_Store",
		},
	},
}

M.treesitter = {
	ensure_installed = {
		"lua",
		"bash",
		"html",
		"css",
		"astro",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"python",
		"markdown_inline",
		"json",
		"json5",
		"jsonc",
		"yaml",
		"toml",
		"csv",
	},
	highlight = {
		enable = true,
		language_tree = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
}

return M
