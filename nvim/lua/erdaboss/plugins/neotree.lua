return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup {
			sources = {
				"filesystem",
				"git_status",
			},
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			source_selector = {
				statusline = true, -- Toggle to show selector on statusline
				winbar = true,
				sources = {
					{
						source = "filesystem",
					},
					{
						source = "git_status",
					},
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute {
							action = "close",
						}
					end,
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚",
						modified = "󰏫",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				mappings = {
					["s"] = "open_split",
					["v"] = "open_vsplit",
					["c"] = "",
					["m"] = "",
				},
			},
			filesystem = {
				window = {
					mappings = {
						["<bs>"] = "",
						["."] = "",
						["/"] = "",
						["#"] = "",
						["D"] = "",
						["f"] = "",
						["<c-x>"] = "",
						["o"] = "",
						["oc"] = "",
						["od"] = "",
						["og"] = "",
						["om"] = "",
						["on"] = "",
						["os"] = "",
						["ot"] = "",
					},
					fuzzy_finder_mappings = {
						["<down>"] = "",
						["<C-n>"] = "",
						["<up>"] = "",
						["<C-p>"] = "",
					},
				},
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = {
						".DS_Store",
						"thumbs.db",
						"node_modules",
						".git",
						".obsidian",
					},
				},
			},
			git_status = {
				window = {
					mappings = {
						["A"] = "",
						["gu"] = "",
						["ga"] = "",
						["gr"] = "",
						["gc"] = "",
						["gp"] = "",
						["gg"] = "",
						["o"] = "",
						["oc"] = "",
						["od"] = "",
						["om"] = "",
						["on"] = "",
						["os"] = "",
						["ot"] = "",
					},
				},
			},
		}
	end,
}
