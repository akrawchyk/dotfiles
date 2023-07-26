vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
