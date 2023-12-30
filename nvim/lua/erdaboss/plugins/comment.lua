return {
	"echasnovski/mini.comment",
	version = "*",
	event = "BufRead",
	config = function()
		require("mini.comment").setup {
			mappings = {
				comment_line = "<C-_>",
				comment_visual = "<C-_>",
			},
		}
	end,
}
