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

-- opt.guicursor = ""
opt.wrap = false

opt.winbar = "%=%m %f"

opt.nu = true
opt.relativenumber = true

opt.autoindent = true
opt.smartindent = true

opt.smartcase = true
opt.ruler = true
opt.cursorline = true
opt.mouse = "a"
opt.laststatus = 2
opt.scrolloff = 8

opt.termguicolors = true

opt.hlsearch = false
opt.incsearch = true
