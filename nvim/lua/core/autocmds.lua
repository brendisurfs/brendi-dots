vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function(ev)
        vim.lsp.buf.format({ async = false })
    end,
})

vim.cmd [[
      autocmd BufNewFile,BufRead *.yuck set syntax=clojure
]]
