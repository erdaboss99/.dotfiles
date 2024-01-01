return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp", -- Source for Copilot
		"hrsh7th/cmp-buffer", -- Source for text in buffer
		"hrsh7th/cmp-path", -- Source for file paths
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- for Lua auto completion
		"rafamadriz/friendly-snippets", -- Snippet library
		"hrsh7th/cmp-nvim-lsp", -- Source for lsp
		{
			"onsails/lspkind.nvim", -- Pictogram library
			config = function()
				require("lspkind").init {
					symbol_map = {
						Copilot = "",
					},
				}
			end,
		},
	},
	config = function()
		require("copilot_cmp").setup()
		local cmp = require "cmp"
		local luasnip = require "luasnip"
		local lspkind = require "lspkind"

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup {
			completion = {
				completeopt = "menu,menuone,noselect,preview",
			},
			view = {
				docs = {
					auto_open = false,
				},
			},
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
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
				expand = function(args) luasnip.lsp_expand(args.body) end,
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
			formatting = {
				format = lspkind.cmp_format {
					maxwidth = 50,
					ellipsis_char = "...",
				},
			},
			sources = {
				{ name = "copilot", group_index = 1 },
				{ name = "nvim_lsp", group_index = 1 },
				{ name = "luasnip", group_index = 1 },
				{ name = "buffer", group_index = 2 },
				{ name = "path", group_index = 2 },
			},
		}
	end,
}
