local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "solargraph", "html", "svelte", "cssls", "tsserver", "clangd", "tailwindcss", "ruby_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- emmet

local configs = require "lspconfig/configs"

configs.ls_emmet = {
  default_config = {
    cmd = { "ls_emmet", "--stdio" },
    filetypes = { "html", "css", "scss" },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

--
-- lspconfig.pyright.setup { blabla}
