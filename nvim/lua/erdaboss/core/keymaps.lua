local function keymap(modes, key, action, args)
	args = args or {}
	local options = {
		noremap = args.noremap ~= nil and args.noremap or true,
		silent = args.silent ~= nil and args.silent or true,
		nowait = args.nowait ~= nil and args.nowait or true,
		desc = args.desc,
	}
	for _, mode in ipairs(modes) do
		vim.api.nvim_set_keymap(mode, key, action, options)
	end
end

keymap({ "n", "i" }, "<Char-0xAA>", "<ESC><CMD>w<CR>", { desc = "Save current buffer" }) -- <CMD-s>
keymap({ "n", "i" }, "<C-s>", "<ESC><CMD>w<CR>", { desc = "Save current buffer" }) -- <Control-s>
keymap({ "n", "i" }, "<C-q>", "<CMD>qa<CR>", { desc = "Attempt to quit all" })
keymap({ "n" }, "<TAB>", "<CMD>bnext<CR>", { desc = "Next buffer" })

keymap({ "i" }, "jk", "<ESC>", { desc = "Exit from insert mode" })
keymap({ "i" }, "kj", "<ESC>", { desc = "Exit from insert mode" })

keymap({ "n" }, "<C-j>", "<C-d>zz", { desc = "Scroll down half a page", nowait = false })
keymap({ "n" }, "<C-k>", "<C-u>zz", { desc = "Scroll up half a page", nowait = false })
keymap({ "n" }, "H", "^", { desc = "Jump to the first non-blank character of the line", nowait = false })
keymap({ "n" }, "L", "$", { desc = "Jump to the last character of the line", nowait = false })

keymap({ "n" }, "yw", "yiw", { desc = "Yank current word", nowait = false })
keymap({ "n" }, "dw", "diw", { desc = "Delete current word", nowait = false })
keymap({ "n" }, "cw", "ciw", { desc = "Change current word", nowait = false })

keymap({ "n" }, "J", "mzJ`z", { desc = "Join lines", nowait = false })

keymap({ "n" }, "<A-Down>", "V:m '>+1<CR>gv=gv<ESC>", { desc = "Move line down" })
keymap({ "n" }, "<A-Up>", "V:m '<-2<CR>gv=gv<Esc>", { desc = "Move line up" })

keymap({ "v" }, "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap({ "v" }, "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

keymap({ "n" }, "<leader>lg", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

keymap({ "n" }, "<leader>ct", "<CMD>Copilot toggle<CR>", { desc = "Toggle Copilot" })

keymap({ "n", "i" }, "<Char-0xAB>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer" }) -- <CMD-b>
keymap({ "n", "i" }, "<C-b>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer" }) -- <Control-b>

keymap({ "n" }, "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
keymap({ "n" }, "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Find word" })
keymap({ "n" }, "<leader>fg", "<CMD>Telescope git_files<CR>", { desc = "Find git files" })
keymap({ "n" }, "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Find keymaps" })
keymap({ "n" }, "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Find help page" })
keymap({ "n" }, "<leader>fb", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "List buffers" })
keymap({ "n" }, "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "List diagnostics" })
