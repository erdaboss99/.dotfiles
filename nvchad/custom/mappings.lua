local M = {}
M.disabled = {
	n = {
		-- Toggle file explorer
		["<C-n>"] = "",

		-- Toggle numbers
		["<leader>n"] = "",

		-- Toggle relative number
		["<leader>rn"] = "",

		-- Focus file explorer
		["<leader>e"] = "",

		-- New buffer
		["<leader>b"] = "",

		-- New vertical terminal
		["<leader>v"] = "",

		-- New horizontal terminal
		["<leader>h"] = "",

		-- LSP manual format
		["<leader>fm"] = "",

		-- LSP rename action
		["<leader>ra"] = "",

		-- LSP code action
		["<leader>ca"] = "",

		-- LSP Set diagnostics list
		["<leader>q"] = "",

		-- Gitsigns toggle deleted
		["<leader>td"] = "",

		-- Gitsigns reset hunk
		["<leader>rh"] = "",

		-- Gitsigns preview hunk
		["<leader>ph"] = "",

		-- Gitsigns navigation through hunks
		["]c"] = "",
		["[c"] = "",
		["<C-q>"] = "",

		-- Gitsigns blame
		["<leader>gb"] = "",

		-- Gitsigns commits
		["<leader>cm"] = "",

		-- Gitsigns git status
		["<leader>gt"] = "",

		-- Telescope find old files
		["<leader>fo"] = "",

		-- Telescope pick hidden term
		["<leader>pt"] = "",

		-- Telescope bookmarks
		["<leader>ma"] = "",

		-- Telescope help page
		["<leader>fh"] = "",

		-- Telescope find in current buffer
		["<leader>fz"] = "",

		-- Navigate between windows within normal mode
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",

		-- Jump to current context
		["<leader>cc"] = "",

		-- Cheat sheet
		["<leader>ch"] = "",

		-- Themes selector
		["<leader>th"] = "",
	},
	i = {
		["<C-n>"] = "",
		-- Navigate between windows within insert mode
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",

		-- Go to beginning and end of the line
		["<C-e>"] = "",
		["<C-b>"] = "",
		["<C-q>"] = "",
	},
	v = {
		["<C-q>"] = "",

		-- LSP code action
		["<leader>ca"] = "",
	},
}

M.env = {
	n = {
		["<leader>el"] = { "<cmd>Lazy<CR>", "Open Lazy" },
		["<leader>em"] = { "<cmd>Mason<CR>", "Open Mason" },
		["<leader>et"] = { "<cmd>TSInstallInfo<CR>", "Open Treesitter" },
		["<leader>ec"] = { "<cmd>Copilot toggle<CR>", "Toggle Github Copilot" },
	},
}

M.general = {
	n = {
		["<C-s>"] = { "<cmd>w<CR>", "Save file" },
		["<C-q>"] = { "<cmd>wqa<CR>", "Save all files and quit" },
		["<leader>wc"] = { "<cmd>NvCheatsheet<CR>", "Cheatsheet" },
	},
	i = {
		["<C-s>"] = { "<ESC><cmd>w<CR>", "Save file" },
		["<C-q>"] = { "<ESC><cmd>wqa<CR>", "Save all files and quit" },
		["<ESC>"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },

		["jk"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
		["kj"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
		["jj"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
		["kk"] = { "<ESC>", "Exit insert mode", opts = { nowait = true } },
	},
}

M.navigation = {
	n = {
		["<C-j>"] = { "<C-d>zz", "Scroll down half a page" },
		["<C-k>"] = { "<C-u>zz", "Scroll up half a page" },
		["H"] = { "^", "Jump to the first non-blank character of the line" },
		["L"] = { "$", "Jump to the last character of the line" },
	},
}

M.editor = {
	n = {
		["yw"] = { "yiw", "Yank current word" },
		["dw"] = { "diw", "Delete current word" },
		["cw"] = { "ciw", "Change current word" },
		["J"] = { "mzJ`z", "Join lines" },
		["<A-Down>"] = { "V:m '>+1<CR>gv=gv<ESC>", "Move line down" },
		["<A-Up>"] = { "V:m '<-2<CR>gv=gv<ESC>", "Move line up" },
	},
	v = {
		["<A-Down>"] = { ":m '>+1<CR>gv=gv", "Move line down" },
		["<A-Up>"] = { ":m '<-2<CR>gv=gv", "Move line up" },
	},
}

M.telescope = {
	plugin = true,
	n = {
		["<leader>fg"] = { "<cmd>Telescope git_files<CR>", "Find in git files" },
		["<leader>fs"] = { "<cmd>Telescope spell_suggest<CR>", "List spell suggestions" },
		["<leader>fc"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
		["<leader>t"] = { "<cmd>Telescope themes <CR>", "Select themes" },
	},
}

M.lspconfig = {
	plugin = true,
	n = {
		["<leader>lr"] = {
			function() require("nvchad.renamer").open() end,
			"LSP rename action",
		},
		["<leader>lc"] = {
			function() vim.lsp.buf.code_action() end,
			"LSP code action",
		},
	},
}

M.typescript = {
	plugin = true,
	n = {
		["<leader>lo"] = { "<cmd>OrganizeImports<CR>", "Organize TypeScript imports" },
	},
}

M.nvimtree = {
	plugin = true,
	n = {
		["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle File Explorer" },
		["<C-e>"] = { "<cmd> NvimTreeFocus <CR>", "Focus File Explorer" },
	},
}

M.lazygit = {
	n = {
		["<leader>g"] = { "<cmd>LazyGit<CR>", "Open LazyGit" },
	},
}

-- M.neotest = {
-- 	plugin = true,
-- 	n = {
-- 		["<leader>tp"] = { "<cmd>NeotestPlaywrightProject<CR>", "Change project config" },
-- 		["<leader>tP"] = { "<cmd>NeotestPlaywrightPreset<CR>", "Change preset" },
-- 		["<leader>tr"] = { "<cmd>NeotestPlaywrightRefresh<CR>", "Refresh project" },
-- 		["<leader>tt"] = {
-- 			function()
-- 				require("neotest").run.run(vim.fn.expand("%"))
-- 			end,
-- 			"Run File",
-- 		},
-- 		["<leader>tT"] = {
-- 			function()
-- 				require("neotest").run.run(vim.loop.cwd())
-- 			end,
-- 			"Run All Test Files",
-- 		},
-- 		["<leader>tn"] = {
-- 			function()
-- 				require("neotest").run.run()
-- 			end,
-- 			"Run Nearest",
-- 		},
-- 		["<leader>ta"] = {
-- 			function()
-- 				require("neotest").run.attach()
-- 			end,
-- 			"Attach",
-- 		},
-- 		["<leader>ts"] = {
-- 			function()
-- 				require("neotest").summary.toggle()
-- 			end,
-- 			"Toggle Summary",
-- 		},
-- 		["<leader>to"] = {
-- 			function()
-- 				require("neotest").output_panel.toggle()
-- 			end,
-- 			"Toggle Output Panel",
-- 		},
-- 		["<leader>tS"] = {
-- 			function()
-- 				require("neotest").run.stop()
-- 			end,
-- 			"Stop",
-- 		},
-- 	},
-- }

return M
