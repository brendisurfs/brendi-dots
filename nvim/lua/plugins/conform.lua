return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				-- Use a sub-list to run only the first available formatter
				haskell = { "fourmolu" },
				javascript = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				go = { "golines", "goimports" },
				zig = { "zls" },
			},
		})
	end,
}
