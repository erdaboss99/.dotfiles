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
keymap({ "n" }, "<C-w>b", "<CMD>bd<CR>", { desc = "Delete buffer" })

keymap({ "i" }, "jk", "<ESC>", { desc = "Exit from insert mode" })
keymap({ "i" }, "kj", "<ESC>", { desc = "Exit from insert mode" })
keymap({ "n" }, "<C-c>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })

keymap({ "n" }, "<C-j>", "<C-d>zz", { desc = "Scroll down half a page" })
keymap({ "n" }, "<C-k>", "<C-u>zz", { desc = "Scroll up half a page" })
keymap({ "n" }, "H", "^", { desc = "Jump to the first non-blank character of the line" })
keymap({ "n" }, "L", "$", { desc = "Jump to the last character of the line" })

keymap({ "n" }, "<C-y>", "ggVG", { desc = "Select all" })

keymap({ "n" }, "yw", "yiw", { desc = "Yank current word" })
keymap({ "n" }, "dw", "diw", { desc = "Delete current word" })
keymap({ "n" }, "cw", "ciw", { desc = "Change current word" })

keymap({ "n" }, "J", "mzJ`z", { desc = "Join lines" })

keymap({ "n" }, "<A-Down>", "<CMD>m .+1<CR>==", { desc = "Move line down" })
keymap({ "n" }, "<A-Up>", "<CMD>m .-2<CR>==", { desc = "Move line up" })
keymap({ "i" }, "<A-Down>", "<ESC><CMD>m .+1<CR>==gi", { desc = "Move line down" })
keymap({ "i" }, "<A-Up>", "<ESC><CMD>m .-2<CR>==gi", { desc = "Move line up" })
keymap({ "v" }, "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap({ "v" }, "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

keymap({ "n" }, "<S-A-Up>", "yyP", { desc = "Duplicate line" })
keymap({ "n" }, "<S-A-Down>", "yyp", { desc = "Duplicate line " })
keymap({ "v" }, "<S-A-Up>", "yP", { desc = "Duplicate selected lines" })
keymap({ "v" }, "<S-A-Down>", "yP", { desc = "Duplicate selected lines " })

keymap({ "n" }, "<leader>lg", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

keymap({ "n" }, "<leader>ct", "<CMD>Copilot toggle<CR>", { desc = "Toggle Copilot" })

keymap({ "n", "i" }, "<Char-0xAB>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer" }) -- <CMD-b>
keymap({ "n", "i" }, "<C-b>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer" }) -- <Control-b>

keymap({ "n" }, "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
keymap({ "n" }, "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Find word" })
keymap({ "n" }, "<leader>fg", "<CMD>Telescope git_files<CR>", { desc = "Find git files" })
keymap({ "n" }, "<leader>fs", "<CMD>Telescope git_status<CR>", { desc = "Find git changes" })
keymap({ "n" }, "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Find keymaps" })
keymap({ "n" }, "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Find help page" })
keymap({ "n" }, "<leader>fb", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "List buffers" })
keymap({ "n" }, "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "List diagnostics" })
keymap({ "n" }, "<leader>fn", "<CMD>ObsidianSearch<CR>", { desc = "Find notes" })
keymap({ "n" }, "<leader>ft", "<CMD>ObsidianTemplate<CR>", { desc = "Find note templates" })

keymap({ "n" }, "<leader>nt", "<CMD>ObsidianToday<CR>", { desc = "Today's note" })
keymap({ "n" }, "<leader>nn", ":ObsidianNew ", { desc = "New  note" })
