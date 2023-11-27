local M = {}

M.general = {
  n = {
    ["<C-n>"] = { "" },
    ["S"] = { "" },
  },
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

M.nvimtree = {
  n = {
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Open LazyGit", opts = { silent = true } },
  },
}

M.switch = {
  n = {
    ["<leader>cs"] = { ":Switch <CR>", opts = { silent = true } },
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
