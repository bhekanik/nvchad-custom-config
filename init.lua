local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Auto format on save
autocmd("BufWritePre", {
  pattern = "*",
  command = "lua vim.lsp.buf.format()",
})

local opt = vim.opt

opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.incsearch = true
opt.smartcase = true
opt.ruler = true
opt.cursorline = true
opt.mouse = "a"
opt.laststatus = 2
opt.hlsearch = true
