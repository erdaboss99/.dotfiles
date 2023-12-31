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
					},
				},
				lualine_c = {},
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
