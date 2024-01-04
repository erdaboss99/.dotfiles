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

keymap({ "n", "i", "v" }, "<Char-0xAA>", "<ESC><CMD>w<CR>", { desc = "Save current buffer" }) -- <CMD-s>
keymap({ "n", "i", "v" }, "<C-s>", "<ESC><CMD>w<CR>", { desc = "Save current buffer" }) -- <Control-s>
keymap({ "n", "i", "v" }, "<C-q>", "<ESC><CMD>qa!<CR>", { desc = "Attempt to quit all" })

keymap({ "n" }, "<TAB>", "<CMD>bnext<CR>", { desc = "Next buffer" })
keymap({ "n" }, "<S-TAB>", "<CMD>bprev<CR>", { desc = "Previous buffer" })
keymap({ "n" }, "<C-w>b", "<CMD>bd<CR>", { desc = "Close buffer" })

keymap({ "i" }, "jk", "<ESC>", { desc = "Exit from insert mode" })
keymap({ "i" }, "kj", "<ESC>", { desc = "Exit from insert mode" })

keymap({ "n" }, "<C-c>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap({ "n" }, "n", "nzzzv", { desc = "Keep next search term centered" })
keymap({ "n" }, "N", "Nzzzv", { desc = "Keep previous search term centered" })

keymap({ "n" }, "<C-d>", "<C-d>zz", { desc = "Scroll down half a page" })
keymap({ "n" }, "<C-u>", "<C-u>zz", { desc = "Scroll up half a page" })
keymap({ "n" }, "H", "^", { desc = "Jump to the first non-blank character of the line" })
keymap({ "n" }, "L", "$", { desc = "Jump to the last character of the line" })

keymap({ "n" }, "<C-y>", "ggVG", { desc = "Select all" })

keymap({ "n" }, "yw", "yiw", { desc = "Yank current word" })
keymap({ "n" }, "dw", "diw", { desc = "Delete current word" })
keymap({ "n" }, "cw", "ciw", { desc = "Change current word" })

keymap({ "n" }, "J", "mzJ`z", { desc = "Join lines" })

keymap({ "v" }, "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap({ "v" }, "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

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
