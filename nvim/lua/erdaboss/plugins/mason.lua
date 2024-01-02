return {

	"WhoIsSethDaniel/mason-tool-installer.nvim",
	lazy = false,
	dependencies = {
		{
			"williamboman/mason.nvim",
			cmd = {
				"Mason",
				"MasonInstall",
				"MasonInstallAll",
				"MasonUpdate",
			},
			config = function() require("mason").setup() end,
		},
	},
	config = function()
		require("mason-tool-installer").setup {
			ensure_installed = {
				-- LSPs
				"lua-language-server", -- Lua LSP
				"astro-language-server", -- Astro LSP
				"emmet-ls", -- Emmet LSP
				"css-lsp", -- CSS LSP
				"html-lsp", -- HTML LSP
				"json-lsp", -- JSON LSP
				"marksman", -- Markdown and MDX LSP
				"tailwindcss-language-server", -- TailwindCSS LSP
				"typescript-language-server", -- TypeScript, JavaScript, JSX and TSX LSP
				"eslint-lsp", -- ESLint LSP - Linter for JavaScript and TypeScript
				"prisma-language-server", -- Prisma ORM LSP
				"bash-language-server", -- Bash LSP
				"pyright", -- Python LSP
				"taplo", -- TOML LSP

				-- Formatters
				"prettier", -- Formatter for Astro, HTML, CSS, Markdown, MDX, JavaScript, TypeScript, JSX, TSX, JSON
				"shfmt", -- Bash formatter
				"black", -- Python formatter
				"stylua", -- Lua formatter

				-- Linters
				"shellcheck", -- Bash linter
				"luacheck", -- Lua linter
				"flake8", -- Python linter
			},
		}
	end,
}
