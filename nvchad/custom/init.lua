vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"

vim.opt.relativenumber = true

vim.opt.iskeyword:append "-"

vim.filetype.add {
	extension = {
		mdx = "mdx",
	},
}

-- Autocmds
-- Automatically lint on save
vim.api.nvim_create_autocmd({
	"BufWritePost",
}, {
	callback = function() require("lint").try_lint() end,
})
