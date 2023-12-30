return {
	"echasnovski/mini.surround",
	version = "*",
	event = "BufRead",
	config = function() require("mini.surround").setup() end,
}
