return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local lspconf = require "lspconfig"

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
		lspconf.lua_ls.setup {
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
		lspconf.tsserver.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- ESLint LSP
		lspconf.eslint.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- Astro LSP
		lspconf.astro.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- JSON LSP
		lspconf.jsonls.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- HTML LSP
		lspconf.html.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- CSS LSP
		lspconf.cssls.setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				css = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
				scss = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
				less = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
			},
		}

		-- TailwindCSS LSP
		lspconf.tailwindcss.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Markdown and MDX LSP
		lspconf.marksman.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Prisma ORM LSP
		lspconf.prismals.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Emmet LSP
		lspconf.emmet_ls.setup {
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
		lspconf.pyright.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"python",
			},
		}

		-- Bash (Shell) LSP
		lspconf.bashls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- TOML LSP
		lspconf.taplo.setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
}
