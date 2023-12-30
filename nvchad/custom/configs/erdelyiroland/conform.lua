local formatters = {
	lua = { "stylua" },
	python = { "autopep8" },
	yaml = { "yamlfmt" },
	sh = { "shfmt" },
	["*"] = { "trim_whitespace" },
}

local prettier_ft = {
	"astro",
	"css",
	"html",
	"json",
	"javascriptreact",
	"javascript",
	"markdown",
	"typescript",
	"typescriptreact",
}

for _, filetype in pairs(prettier_ft) do
	formatters[filetype] = { "prettier" }
end

return {
	format_after_save = {
		async = true,
	},
	notify_on_error = true,

	formatters_by_ft = formatters,
	formatters = {
		prettier = {
			inherit = true,
			prepend_args = { "--ignore-path", "./.prettierignore" },
		},
	},
}
