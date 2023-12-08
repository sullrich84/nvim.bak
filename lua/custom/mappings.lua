local M = {}

M.general = {
  v = {
    [">"] = { ">gv", "indent", opts = { silent = true } },
    ["<D-s>"] = { ":w <CR>", "Save", opts = { silent = true } },
  },
  i = {
    ["<C-s>"] = { "<esc>:w <CR>", "Save", opts = { silent = true } },
  },
}

M.telescope = {
  n = {
    ["<leader>tp"] = {
      ":lua require'telescope'.extensions.project.project{}<CR>",
      "Open projects view",
      opts = { noremap = true, silent = true },
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { ":LazyGit <CR>", "Open LazyGit", opts = { silent = true } },
  },
}

M.dap = {
  n = {
    ["<F5>"] = { ":lua require'dap'.continue()<CR>", "DAP continue" },
    ["<F10>"] = { ":lua require'dap'.step_over()<CR>", "DAP step over" },
    ["<F11>"] = { ":lua require'dap'.step_into()<CR>", "DAP step into" },
    ["<F12>"] = { ":lua require'dap'.step_out()<CR>", "DAP step out" },
    ["<leader>b"] = { ":lua require'dap'.toggle_breakpoint()<CR>", "DAP toggle breakpoint" },
    ["<leader>B"] = {
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "DAP breakpoint condition",
    },
    ["<leader>lp"] = {
      ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      "DAP line breakpoint",
    },
    ["<leader>dr"] = { ":lua require'dap'.repl.open()<CR>", "DAP open repl" },
    ["<leader>dl"] = { ":lua require'dap'.run_last()<CR>", "DAP run last" },
    ["<leader>dh"] = { ":lua require'dap.ui.widgets'.hover()<CR>", "DAP open repl" },
    ["<leader>dp"] = { ":lua require'dap.ui.widgets'.preview()<CR>", "DAP open repl" },
    ["<leader>do"] = { ":lua require'dapui'.open()<CR>", "Open DAP UI" },
    ["<leader>dc"] = { ":lua require'dapui'.close()<CR>", "Close DAP UI" },

    -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    --   require('dap.ui.widgets').hover()
    -- end)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    --   require('dap.ui.widgets').preview()
    -- end)
    -- vim.keymap.set('n', '<Leader>df', function()
    --   local widgets = require('dap.ui.widgets')
    --   widgets.centered_float(widgets.frames)
    -- end)
    -- vim.keymap.set('n', '<Leader>ds', function()
    --   local widgets = require('dap.ui.widgets')
    --   widgets.centered_float(widgets.scopes)
    -- end)
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Open NvimTree", opts = { silent = true } },
  },
}

M.switch = {
  n = {
    ["S"] = { ":Switch <CR>", "Switch", opts = { silent = true } },
  },
}

M.sideways = {
  n = {
    ["<leader>cj"] = { ":SidewaysLeft <CR>", "Move param under cursor left", opts = { silent = true } },
    ["<leader>cl"] = { ":SidewaysRight <CR>", "Move param under cursor right", opts = { silent = true } },
  },
  o = {
    ["aa"] = { "<Plug>SidewaysArgumentTextobjA", "Argument under cursor" },
    ["ia"] = { "<Plug>SidewaysArgumentTextobjI", "Argument under cursor" },
  },
  x = {
    ["aa"] = { "<Plug>SidewaysArgumentTextobjA", "Argument under cursor" },
    ["ia"] = { "<Plug>SidewaysArgumentTextobjI", "Argument under cursor" },
  },
}

return M
