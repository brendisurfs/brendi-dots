return {
	"rose-pine/neovim",
	config = function()
		require("rose-pine").setup({
			disable_background = false,
			styles = {
				italic = false,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
