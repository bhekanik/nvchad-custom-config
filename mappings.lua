---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
    ["0"] = { "^", "go to line start", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<leader><F5>"] = { "<cmd> UndotreeToggle<CR>", "Toggle UndoTree"},
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit", opts = { silent = true } },
    -- close buffer + hide terminal buffer
    ["<leader>w"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },

    -- save
    ["<leader>s"] = { "<cmd> w <CR><leader>fm", "save file and format" },
  },
  i = {
    ["£"] = { "#", "hash symbol", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "Add indent", opts = { noremap = true } },
    ["<"] = { "<gv", "Remove indent", opts = { noremap = true } },
  },
}

-- more keybinds!
M.dap = {
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    },
  },
}

return M
