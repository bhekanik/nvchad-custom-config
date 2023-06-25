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

autocmd("BufWritePost", {
  pattern = { "*tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})

-- Organize imports
autocmd("FileType", {
  pattern = { "*.tsx", "*.ts", "*.js", "*.jsx" },
  command =
  "lua vim.lsp.buf.execute_command { command = '_typescript.organizeImports', arguments = { vim.fn.expand('%:p') } }",
})

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

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
