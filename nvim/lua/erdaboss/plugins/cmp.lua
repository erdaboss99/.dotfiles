return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = function() require("copilot_cmp").setup() end,
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
			},
			config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
		},
		{
			"hrsh7th/cmp-buffer",
			{ "hrsh7th/cmp-nvim-lsp", config = true },
		},
	},
	config = function()
		local cmp = require "cmp"
		require("cmp").setup {
			view = {
				docs = {
					auto_open = false,
				},
			},
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
					side_padding = 1,
					scrollbar = false,
					col_offset = -3,
					scrolloff = 8,
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
				},
			},
			snippet = {
				expand = function(args) require("luasnip").lsp_expand(args.body) end,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
			},

			mapping = {
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping.close(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				},
				["<C-d>"] = function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end,
			},
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "lua_snip" },
				{ name = "buffer" },
			},
		}
	end,
}
