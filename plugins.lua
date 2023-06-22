local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Sensible defaults for Rust LSP
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  -- debugger
  {
    "mfussenegger/nvim-dap",
  },

  -- fancy stuff for rust crates
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "copilot", group_index = 2 })
      table.insert(M.sources, { name = "crates" })
      table.insert(M.sources, { name = "nvim_lsp", group_index = 2 })
      table.insert(M.sources, { name = "luasnip", group_index = 2 })
      table.insert(M.sources, { name = "buffer", group_index = 2 })
      table.insert(M.sources, { name = "nvim_lua", group_index = 2 })
      table.insert(M.sources, { name = "path", group_index = 2 })
      return M
    end,
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
  },

  -- Fancy function context at the top
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },

  {
    "f-person/git-blame.nvim",
    lazy = false,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "mbbill/undotree",
    lazy = false,
  },

  -- AI code completion
  {
    "Exafunction/codeium.vim",
    lazy = true,
    enabled = false,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "lewis6991/gitsigns.nvim",
  },

  {
    "mg979/vim-visual-multi",
  },
}

return plugins
