local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = { ":w <CR>", "Save" },
    ["<esc>"] = { ":noh <CR>", "Clear history", opts = { silent = true } },
  },
  v = {
    [">"] = { ">gv", "indent", opts = { silent = true } },
    ["<D-s>"] = { ":w <CR>", "Save", opts = { silent = true } },
  },
  i = {
    ["<C-s>"] = { ":w <CR>", "Save", opts = { silent = true } },
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

return M
