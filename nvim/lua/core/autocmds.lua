local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

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
vim.api.nvim_create_autocmd({ "BufRead", "BufRead" }, {
    pattern = { "*.yuck" },
    callback = function()
        vim.opt.filetype = "clojure"
    end
})

-- vim.cmd [[
--       autocmd BufNewFile,BufRead *.yuck set syntax=clojure
-- ]]
