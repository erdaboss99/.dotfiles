return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local lspconfig = require "lspconfig"

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local on_attach = function()
            -- stylua: ignore start
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to references" })
			vim.keymap.set("n", "D", require("telescope.builtin").lsp_type_definitions, { desc = "Go to type definitions" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Open diagnostics" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
			-- stylua: ignore end
		end
		-- Lua LSP
		lspconfig.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}

		-- TypeScript, JavaScript, JSX and TSX LSP
		lspconfig.tsserver.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- ESLint LSP
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

		-- TOML LSP
		lspconfig.taplo.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}
