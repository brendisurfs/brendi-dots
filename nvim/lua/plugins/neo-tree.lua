return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    init = function()
        if vim.fn.argc(-1) == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                require("neo-tree").setup({
                    window = {
                        position = "current",
                    },
                })
            end
        end
    end,
    config = function()
        require("neo-tree").setup {
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tb
            enable_git_status = true,
            enable_diagnostics = true,
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            window = {
                position = "right",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
            }

        }
    end
}
