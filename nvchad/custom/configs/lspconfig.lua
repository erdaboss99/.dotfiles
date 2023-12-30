local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

-- Import organize for TypeScript, JavaScript, JSX and TSX
local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = {
			vim.api.nvim_buf_get_name(0),
		},
	}
	vim.lsp.buf.execute_command(params)
end

-- TypeScript, JavaScript, JSX and TSX LSP
lspconfig.tsserver.setup {
	on_attach = function() require("core.utils").load_mappings "typescript" end,

	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
}

lspconfig.eslint.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Astro LSP
lspconfig.astro.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- JSON LSP
lspconfig.jsonls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- HTML LSP
lspconfig.html.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- CSS LSP
lspconfig.cssls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- TailwindCSS LSP
lspconfig.tailwindcss.setup {

	-- on_attach = function(_, bufnr)
	-- 	require("tailwindcss-colors").buf_attach(bufnr)
	-- 	attach(_, bufnr)
	-- end,
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Markdown and MDX LSP
lspconfig.marksman.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Prisma ORM LSP
lspconfig.prismals.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Emmet LSP
lspconfig.emmet_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"astro",
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"svelte",
	},
}

-- Python LSP
lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"python",
	},
}

-- Bash (Shell) LSP
lspconfig.bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
