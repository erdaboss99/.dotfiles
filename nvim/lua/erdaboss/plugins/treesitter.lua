return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local config = require "nvim-treesitter.configs"
			local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
			ft_to_parser.mdx = "markdown"
			config.setup {
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				ensure_installed = {
					"lua",
					"bash",
					"html",
					"css",
					"javascript",
					"typescript",
					"astro",
					"tsx",
					"python",
					"markdown",
					"markdown_inline",
					"json",
					"jsonc",
					"yaml",
					"toml",
					"csv",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-s>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
			}
		end,
	},
}
