vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>pv", vim.cmd.Ex)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("n", "gh", vim.lsp.buf.hover, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "ga", vim.lsp.buf.code_action, opts)
map("n", "g[", vim.diagnostic.goto_prev, opts)
map("n", "g]", vim.diagnostic.goto_next, opts)
map("n", "<c-]>", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.implementation, opts)
map("n", "g0", vim.lsp.buf.document_symbol, opts)
map("n", "1gD", vim.lsp.buf.type_definition, opts)
map("n", "gW", vim.lsp.buf.workspace_symbol, opts)
map("n", "<c-k>", vim.lsp.buf.signature_help, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- neotree settings
map("n", "<C-t>", "<Cmd>Neotree toggle<CR>")
map("n", "<C-f>", "<Cmd>Neotree reveal<CR>")

-- barbar settings
-- map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
-- map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- bufferline setting
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
map("n", "<A-c>", ":bp <BAR> bd #<CR>", opts)
-- nmap <Space>q :bp <BAR> bd #<CR>
-- map("n", "<A-c>", "<Cmd>BufferLinePickClose<CR>", opts)

-- no neck pain
map("n", "<leader>np", "<Cmd>NoNeckPain<CR>", opts)
