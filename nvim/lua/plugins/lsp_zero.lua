return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	-- efm configs
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x", -- version is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				enabled = true,
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp.mapping.confirm({ select = true }),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<C-n>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<C-p>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
				}),
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("neodev").setup({})

			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()
			vim.diagnostic.config({
				virtual_text = false,
			})

			--- if you want to know more about lsp-zero and mason.nvim
			--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = { "rust_analyzer" },
				handlers = {
					lsp_zero.default_setup,
					zls = function()
						require("lspconfig").zls.setup({})
					end,
					gopls = function()
						require("lspconfig").gopls.setup({
							analyses = {
								unusedparams = true,
								shadow = true,
							},
							staticcheck = true,
						})
					end,
					htmx = function()
						require("lspconfig").htmx.setup({})
					end,
					hls = function()
						require("lspconfig").hls.setup({})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({
							settings = {
								pyright = {
									venvPath = { "/Users/brendi/Library/Caches/pypoetry/virtualenvs" },
									autoSearchPaths = true,
									python = {
										analysis = {
											typeCheckingMode = "strict",
											autoImportCompletions = true,
										},
									},
								},
							},
						})
					end,
					rust_analyzer = function()
						require("lspconfig").rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									cargo = {
										unsetTest = {
											"time",
										},
									},
									procMacro = {
										enable = true,
									},
									checkOnSave = {
										command = "clippy",
									},
								},
							},
						})
					end,

					efm = function()
						local prettier = {
							formatCommand = 'prettierd "${INPUT}"',
							formatStdin = true,
							env = {
								string.format(
									"PRETTIERD_DEFAULT_CONFIG=%s",
									vim.fn.expand("~/.config/nvim/utils/linter-config/.prettierrc.json")
								),
							},
						}
						local goimports = require("efmls-configs.formatters.goimports")
						local golines = require("efmls-configs.formatters.golines")
						local stylua = require("efmls-configs.formatters.stylua")
						local biome = require("efmls-configs.formatters.biome")

						require("lspconfig").efm.setup({
							init_options = { documentFormatting = true },
							settings = {
								rootMarkers = {
									"*.go",
									".git/",
									".cabal",
									"node_modules",
									"go.mod",
									"package.json",
								},
								languages = {
									lua = { stylua },
									svelte = { prettier },
									typescriptreact = { biome },
									go = { golines, goimports },
									python = {
										{ formatCommand = "yapf --quiet", formatStdin = true },
									},
								},
							},
						})
					end,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
}
