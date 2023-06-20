local M = {}

M.treesitter = {
  ensure_installed = {
    "c",
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "python",
    "rust",
    "svelte",
    "svelte",
    "terraform",
    "tsx",
    "typescript",
    "vim",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "prettier-eslint",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "svelte-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "rust-analyzer",
    "prisma-language-server",
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
