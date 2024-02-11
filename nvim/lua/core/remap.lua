vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local set = vim.keymap.set

set("n", "<leader>rn", vim.lsp.buf.rename, opts)
set("n", "<leader>pv", vim.cmd.Ex)
set("v", "J", ":m '>+1<CR>gv=gv", opts)
set("v", "K", ":m '<-2<CR>gv=gv", opts)
set("n", "gh", vim.lsp.buf.hover, opts)
set("n", "gd", vim.lsp.buf.definition, opts)
set("n", "gr", vim.lsp.buf.references, opts)
set("n", "ga", vim.lsp.buf.code_action, opts)
set("n", "g[", vim.diagnostic.goto_prev, opts)
set("n", "g]", vim.diagnostic.goto_next, opts)
set("n", "<c-]>", vim.lsp.buf.definition, opts)
set("n", "gD", vim.lsp.buf.implementation, opts)
set("n", "g0", vim.lsp.buf.document_symbol, opts)
set("n", "1gD", vim.lsp.buf.type_definition, opts)
set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

set('n', "<C-t>", "<Cmd>Neotree toggle<CR>")
