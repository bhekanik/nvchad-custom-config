---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
    ["0"] = { "^", "go to line start", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-d>"] = { "<C-d>zz", "Page down and center" },
    ["<C-u>"] = { "<C-u>zz", "Page up and center" },
    ["N"] = { "Nzz", "Previous found item centered" },
    ["n"] = { "nzz", "Next found item centered" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader><F5>"] = { "<cmd> UndotreeToggle<CR>", "Toggle UndoTree" },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit", opts = { silent = true } },
    -- close buffer + hide terminal buffer
    ["<leader>w"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    -- save
    ["<leader>s"] = { "<cmd> w <CR>", "save file" },
  },
  i = {
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "Add indent", opts = { noremap = true } },
    ["<"] = { "<gv", "Remove indent", opts = { noremap = true } },
  },
}

M.nvterm = {
  plugin = true,
  t = {
    ["<C-j>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
  },
  n = {
    ["<C-j>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
  },
}

-- more keybinds!
M.dap = {
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M
