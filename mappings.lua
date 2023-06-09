---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
    ["0"] = { "^", "go to line start", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-d>"] = { "<C-d>zz", "Page down and center" },
    ["<C-u>"] = { "<C-u>zz", "Page up and center" },
    ["N"] = { "Nzzzv", "Previous found item centered" },
    ["n"] = { "nzzzv", "Next found item centered" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader><F5>"] = { "<cmd> UndotreeToggle<CR>", "Toggle UndoTree" },
    ["<leader>sv"] = { "<cmd> :vsplit<CR>", "Split buffer vertically" },
    ["<leader>sh"] = { "<cmd> :split<CR>", "Split buffer horizontally" },
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
    ["-"] = {
      function()
        require("oil").open_float()
      end,
      "Open parent directory floating",
    },
    ["<leader>-"] = {
      function()
        require("oil").toggle_float()
      end,
      "Toggle Oil floating",
    },
    ["<leader>pf"] = {
      function()
        require("telescope.builtin").find_files()
      end,
      "Find files",
    },
    ["<C-p>"] = {
      function()
        require("telescope.builtin").git_files()
      end,
      "Find git files",
    },
    ["<leader>ps"] = {
      function()
        require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
      end,
      "Grep",
    },
  },

  i = {
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
  },

  v = {
    [">"] = { ">gv", "Add indent", opts = { noremap = true } },
    ["<"] = { "<gv", "Remove indent", opts = { noremap = true } },
    ["J"] = { ":m '>+1<CR>gv=gv", "Add indent" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Remove indent" },
    ["-"] = {
      function()
        require("oil").open_float()
      end,
      "Open parent directory floating",
    },
    ["<leader>-"] = {
      function()
        require("oil").toggle_float()
      end,
      "Toggle Oil floating",
    },
  },

  x = {
    ["p"] = { '"_dP', "Paste from clipboard", opts = { noremap = true } },
  },
}

M.nvterm = {
  plugin = true,
  t = {
    -- ["<C-h>"] = {
    --   function()
    --     require("nvterm.terminal").toggle "horizontal"
    --   end,
    --   "toggle horizontal term",
    -- },
  },
  n = {
    -- ["<C-h>"] = {
    --   function()
    --     require("nvterm.terminal").toggle "horizontal"
    --   end,
    --   "toggle horizontal term",
    -- },
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
