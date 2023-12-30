return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
		},
		config = function()
			require("telescope").setup {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = {
						"node_modules",
						".git",
						".next",
						".DS_Store",
					},
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = {
						"truncate",
					},
					winblend = 0,
					border = {},
					borderchars = {
						"─",
						"│",
						"─",
						"│",
						"╭",
						"╮",
						"╯",
						"╰",
					},
					color_devicons = true,
					set_env = {
						["COLORTERM"] = "truecolor",
					},
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						n = {
							["<ESC>"] = require("telescope.actions").close,
						},
						i = {
							["<ESC>"] = require("telescope.actions").close,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					git_files = {
						hidden = true,
					},
				},
				extensions_list = {
					"themes",
					"terms",
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					},
				},
			}
			require("telescope").load_extension "ui-select"
		end,
	},
}
