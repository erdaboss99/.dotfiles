local o = require "custom.configs.overrides"

local plugins = {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- Formatter
				"stevearc/conform.nvim",
				opts = require "custom.configs.erdelyiroland.conform",
			},
		},
		opts = o.lspconfig,
	},

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function() require("copilot_cmp").setup() end,
			},
		},
		opts = o.cmp,
	},

	-- Syntax Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		opts = o.treesitter,
	},

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		opts = o.nvimtree,
	},

	-- Fuzzy Finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = o.telescope,
	},

	-- External Dependency Installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		config = function() require "custom.configs.erdelyiroland.mason-tool-installer" end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = function() require "custom.configs.erdelyiroland.copilot" end,
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function() require "custom.configs.erdelyiroland.lint" end,
	},

	-- Tailwind CSS Colors
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function() require("tailwindcss-colors").setup() end,
	},

	-- Lazy Git
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},
	{
		"windwp/nvim-autopairs",
		enabled = false,
	},

	-- Testing
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	event = "BufEnter *.spec.ts",
	-- 	dependencies = {
	-- 		"thenbe/neotest-playwright",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("custom.configs.erdelyiroland.neotest")
	-- 		require("core.utils").load_mappings("neotest")
	-- 	end,
	-- },
}
return plugins
