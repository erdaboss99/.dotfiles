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
			},
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			source_selector = {
				statusline = true, -- Toggle to show selector on statusline
				sources = {
					{
						source = "filesystem",
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
			filesystem = {
				window = {
					mappings = {
						["<bs>"] = "", -- Disable navigate_up
						["."] = "", -- Disable set root
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
		}
	end,
}
