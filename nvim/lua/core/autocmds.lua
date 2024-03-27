local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

-- efm formatter
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function(ev)
        local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

        if vim.tbl_isempty(efm) then
            return
        end

        vim.lsp.buf.format({ async = false })
    end,
})
-- conform formatter
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.yuck" },
    callback = function()
        vim.opt.filetype = "clojure"
    end
})

-- vim.cmd [[
--       autocmd BufNewFile,BufRead *.yuck set syntax=clojure
-- ]]
--
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})
