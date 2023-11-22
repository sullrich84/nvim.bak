local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<D-s>"] = { ":w <CR>", "Save" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<D-s>"] = { ":w <CR>", "Save" },
  },
  i = {
    ["<C-s>"] = { ":w <CR>", "Save" },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { ":LazyGit <CR>", "Open LazyGit" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Open LazyGit", opts = { silent = true } },
  },
}

return M
