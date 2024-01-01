return {
	"nvim-neotest/neotest",
	event = "BufEnter *.spec.ts",
	dependencies = {
		"thenbe/neotest-playwright",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup {
			adapters = {
				require("neotest-playwright").adapter {
					options = {
						preset = "none", -- "none" | "headed" | "debug"
						persist_project_selection = false,
						enable_dynamic_test_discovery = false,

						filter_dir = function(name) return name ~= "node_modules" end,
					},
				},
			},
			icons = {
				passed = "",
				running = "",
				failed = "",
				unknown = "",
				-- passed = " ",
				-- running = "",
				-- failed = " ",
				-- unknown = " ",
			},
		}
        -- stylua: ignore start
		vim.keymap.set( "n", "<leader>tp", "<CMD>NeotestPlaywrightProject<CR>", { desc = "Change project config" })
		vim.keymap.set( "n", "<leader>tP", "<CMD>NeotestPlaywrightPreset<CR>", { desc = "Change preset" })
		vim.keymap.set( "n", "<leader>tr", "<CMD>NeotestPlaywrightRefresh<CR>", { desc = "Refresh project" })

		vim.keymap.set( "n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand "%") end, { desc = "Run file" })
		vim.keymap.set( "n", "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, { desc = "Run all test files" })
		vim.keymap.set( "n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Run nearest test" })
		vim.keymap.set( "n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach" })
		vim.keymap.set( "n", "<leader>to", function() require("neotest").output_panel.toggle() end, { desc = "Toggle output panel" })
		vim.keymap.set( "n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop" })
        vim.keymap.set( "n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle summary" })
		-- stylua: ignore end
	end,
}
