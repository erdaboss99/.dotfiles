require("neotest").setup {
	adapters = {
		require("neotest-playwright").adapter {
			options = {
				preset = "none", -- "none" | "headed" | "debug"
				persist_project_selection = false,
				enable_dynamic_test_discovery = true,
			},
		},
	},
	icons = {
		passed = "",
		running = "",
		failed = "",
		unknown = "",
	},
}
