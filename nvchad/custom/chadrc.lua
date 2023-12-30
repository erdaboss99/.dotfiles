---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",
	lsp_semantic_tokens = false,
	transparency = true,
	tabufline = {
		lazyload = false,
	},
	hl_override = {
		Comment = { italic = true },
	},
	cheatsheet = { theme = "simple" }, -- simple/grid
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
