return {
    'rose-pine/neovim',
    config = function()
        require("rose-pine").setup {
            disable_background = true,
            dim_nc_background = true,
        }
        vim.cmd('colorscheme rose-pine')
    end
}
