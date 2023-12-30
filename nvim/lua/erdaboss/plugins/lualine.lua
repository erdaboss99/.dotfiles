return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	config = function()
		require("lualine").setup {
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"branch",
					{
						"diff",
						colored = true,
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
					{
						"diagnostics",
						sections = {
							"error",
							"warn",
						},
						colored = true, -- Displays diagnostics status in color if set to true.
						always_visible = true, -- Show diagnostics even if there are none.
					},
				},
				lualine_c = {
					{
						"buffers",
						show_filename_only = true, -- Shows shortened relative path when set to false.
						hide_filename_extension = false, -- Hide filename extension when set to true.
						show_modified_status = true, -- Shows indicator when the buffer is modified.
						symbols = {
							modified = " ●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"filetype",
						colored = true,
						icon_only = false,
					},
				},
				lualine_z = {
					"location",
				},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"neo-tree",
				"quickfix",
			},
		}
	end,
}
