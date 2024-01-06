return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	config = function()
		require("bufferline").setup {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(count, level)
					local icon = level:match "error" and " " or level:match "warning" and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-Tree",
						highlight = "Directory",
						text_align = "center",
					},
				},
			},
		}
	end,
}
