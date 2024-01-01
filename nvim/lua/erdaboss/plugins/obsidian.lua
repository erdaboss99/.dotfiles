return {

	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Vault",
				path = "/Users/erdelyiroland/Library/Mobile Documents/iCloud~md~obsidian/Documents/erdelyiroland",
				overrides = {
					notes_subdir = "Notes",
				},
			},
		},
		daily_notes = {
			folder = "Dailies",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			template = nil,
		},
		mappings = {},
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
	},
}
